require 'treetop'

Treetop.load File.join(File.dirname(__FILE__), '..', '..', 'lib', 'TDL')

parser = TDLParser.new

describe TDLParser do
  describe "#parse" do
    specify { parser.parse('test').should be     }

    specify { parser.parse('t1st').should be     }
    specify { parser.parse('t11t').should be     }
    specify { parser.parse('tes1').should be     }
    specify { parser.parse('te11').should be     }
    specify { parser.parse('1est').should_not be }

    specify { parser.parse('t_st').should be     }
    specify { parser.parse('t__t').should be     }
    specify { parser.parse('tes_').should be     }
    specify { parser.parse('te__').should be     }
    specify { parser.parse('t_s_').should be     }
    specify { parser.parse('_est').should_not be }

    specify { parser.parse('t_1t').should be     }
    specify { parser.parse('t1_t').should be     }
    specify { parser.parse('t1__').should be     }
    specify { parser.parse('t__1').should be     }
    specify { parser.parse('t_1_').should be     }

    specify { parser.parse('test?').should be    }
    specify { parser.parse('tes_?').should be    }
    specify { parser.parse('te1_?').should be    }
    specify { parser.parse('te_1?').should be    }
    specify { parser.parse('?test').should_not be }
    specify { parser.parse('te?st').should_not be }

    specify { parser.parse('test!').should_not be }
    specify { parser.parse('te!st').should_not be }

    specify { parser.parse('a' ).should be }
    specify { parser.parse('A' ).should be }
    specify { parser.parse('Ab').should be }
    specify { parser.parse('aB').should be }
  end
end

