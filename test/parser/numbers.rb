require 'polyglot'
require 'treetop'

Treetop.load File.join(File.dirname(__FILE__), '..', '..', 'lib', 'TDL')

parser = TDLParser.new

describe TDLParser do
  describe "#parse" do
    describe "numbers" do
      specify { parser.parse('1'    ).should be     }
      specify { parser.parse('12345').should be     }
      specify { parser.parse('1.0'  ).should be     }
      specify { parser.parse('1.123').should be     }
      specify { parser.parse('123.4').should be     }
      specify { parser.parse('.1'   ).should_not be }
      specify { parser.parse('1.'   ).should_not be }
    end
  end
end

