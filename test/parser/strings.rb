require 'treetop'

Treetop.load File.join(File.dirname(__FILE__), '..', '..', 'lib', 'TDL')

parser = TDLParser.new

describe TDLParser do
  describe "#parse" do
    specify { parser.parse('"abcd"'    ).should be     } # "abcd"
    specify { parser.parse('"abc\\d"'  ).should be     } # "abc\d"
    specify { parser.parse('"abc\\"d"' ).should be     } # "abc\"d"
    specify { parser.parse('"\\"abcd"' ).should be     } # "\"abcd"
    specify { parser.parse('"abc\r\nd"').should be     } # "abc\r\nd"
    specify { parser.parse('"abc\td\\"').should_not be } # "abc\td\"

    specify { parser.parse("'abcd'"    ).should be     } # 'abcd'
    specify { parser.parse("'abc\\d'"  ).should be     } # 'abc\d'
    specify { parser.parse("'abc\\'d'" ).should be     } # 'abc\"d'
    specify { parser.parse("'\\'abcd'" ).should be     } # '\"abcd'
    specify { parser.parse("'abc\\r\\nd'").should be     } # 'abc\r\nd'
    specify { parser.parse("'abc\\td\\'").should_not be } # 'abc\td\'
  end
end

