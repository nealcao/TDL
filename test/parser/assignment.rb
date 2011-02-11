require 'treetop'

Treetop.load File.join(File.dirname(__FILE__), '..', '..', 'lib', 'TDL')

parser = TDLParser.new

describe TDLParser do
  describe "#parse" do
    specify { parser.parse('a=b'       ).should be     }
    specify { parser.parse('a = b'     ).should be     }
    specify { parser.parse("a = 'b'"   ).should be     }
    specify { parser.parse('a = "b"'   ).should be     }
    specify { parser.parse('a = 1'     ).should be     }
    # TODO: Negative numbers
    #specify { parser.parse('a = -1'    ).should be     }
    specify { parser.parse('a? = b'    ).should be     }
    specify { parser.parse('a?a = b'   ).should_not be }
    specify { parser.parse('a = "b'    ).should_not be }
    specify { parser.parse("a = 'b"    ).should_not be }
    specify { parser.parse('a ='       ).should_not be }
  end
end

