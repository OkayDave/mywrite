require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ArticlesHelper. For example:
#
# describe ArticlesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ArticlesHelper, type: :helper do
  describe "#render_markdown" do
    before do
      @md = %Q{
title
=====

paragraph word word word.

**bold text**
}

      @output = helper.render_markdown(@md)

    end

    it "includes a title" do
      expect(@output).to match(/<h1>/)
    end

    it "includes a paragraph" do
      expect(@output).to match(/<p>/)
    end

    it "includes a bold" do
      expect(@output).to match(/<strong>/)
    end

  end
end
