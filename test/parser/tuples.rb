require 'treetop'

Treetop.load File.join(File.dirname(__FILE__), '..', '..', 'lib', 'TDL')

parser = TDLParser.new

describe TDLParser do
  describe "#parse" do
    specify { parser.parse('()'         ).should be }
    specify { parser.parse('( )'        ).should be }
    specify { parser.parse('(         )').should be }
    specify { parser.parse('(1)'        ).should be }
    specify { parser.parse('(1,2,3)'    ).should be }
    specify { parser.parse('(1, 2, 3)'  ).should be }
    specify { parser.parse('( 1 )'      ).should be }
    specify { parser.parse('( 1 , 2 )'  ).should be }
    specify { parser.parse('( 1 ,2 )'   ).should be }
  end
end
