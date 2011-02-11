require 'treetop'

Treetop.load File.join(File.dirname(__FILE__), '..', '..', 'lib', 'TDL')

parser = TDLParser.new

describe TDLParser do
  describe "#parse" do
    # Whitespace
    specify { parser.parse(' '   ).should be }
    specify { parser.parse('    ').should be }
  end
end
