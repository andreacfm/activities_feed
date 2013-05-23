require 'spec_helper'

describe Document do
  let(:document) { Document.create }

  specify { described_class.respond_to?(:feedable).should be_true }
  it { subject.respond_to?(:create_activity).should be_true }

  describe "#create_activity" do
    before do
      document.create_activity("new_activity")
    end
    specify { Activity.count.should eq 1 }
    specify { Activity.first.feedable_id.should eq document.id }
    specify { Activity.first.feedable_type.should eq 'Document' }
    specify { Activity.first.name.should eq 'new_activity' }
  end

  describe "#stream" do
    before do
      document.create_activity("one")
      document.create_activity("two")
      document.create_activity("three")
    end
    specify { document.feed.should have(3).records }
    specify { document.feed.first.name.should eq 'three' }
    specify { document.feed.last.name.should eq 'one' }
  end

  describe "namespace" do

    class DocumentWithNamespace < ActiveRecord::Base
      self.table_name = :documents
      feedable namespace: 'document'
    end

    let(:document) { DocumentWithNamespace.create }

    before { document.create_activity("one") }
    specify { document.feed.last.name.should eq 'document.one' }

  end


end
