require 'treetop'

Treetop.load File.join(File.dirname(__FILE__), '..', '..', 'lib', 'TDL')

parser = TDLParser.new

describe TDLParser do
  describe "#parse" do
    specify { parser.parse('fn()'         ).should be }
    specify { parser.parse('fn( )'        ).should be }
    specify { parser.parse('fn(         )').should be }
    specify { parser.parse('fn(1)'        ).should be }
    specify { parser.parse('fn(1,2,3)'    ).should be }
    specify { parser.parse('fn(1, 2, 3)'  ).should be }
    specify { parser.parse('fn( 1 )'      ).should be }
    specify { parser.parse('fn( 1 , 2 )'  ).should be }
    specify { parser.parse('fn( 1 ,2 )'   ).should be }

    specify { parser.parse('fn  ()'         ).should be }
    specify { parser.parse('fn  ( )'        ).should be }
    specify { parser.parse('fn  (         )').should be }
    specify { parser.parse('fn  (1)'        ).should be }
    specify { parser.parse('fn  (1,2,3)'    ).should be }
    specify { parser.parse('fn  (1, 2, 3)'  ).should be }
    specify { parser.parse('fn  ( 1 )'      ).should be }
    specify { parser.parse('fn  ( 1 , 2 )'  ).should be }
    specify { parser.parse('fn  ( 1 ,2 )'   ).should be }
  end
end
