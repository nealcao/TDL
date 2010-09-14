# Overview

TDL is a prototype-based event-driven language.

Syntax for event actions:
    ObjName: ObjInheritedFrom {
      EvtName: Event {
        ACTION1
        ACTION2
        ...
      }
    }

Events can have multiple actions. You can declare events multiple times, they'll run in the order added.


Syntax for event triggering:
    OBJECT EVENT()

`OBJECT` can be a literal (string, number, etc).

`OBJECT EVENT()` triggers the event `EVENT` on `OBJECT` (Similar to `OBJECT.EVENT()` in many OOP languages)

# Inheritance, predefined objects, etc

Non-existant objects are references to the `null` object.

`Object` inherits from `null` and adds methods to it.

Objects - excluding `null`, `true`, and `false` - all inherit from the object `Object`.

Events all inherit from the object `Event`.

Numbers all inherit from the object `Number`.

Strings all inherit from the object `String`.

Booleans inherit from either `true` or `false`.

Arrays all inherit from the object `Array`.

Hashes all inherit from the object `Hash`.

All events without a receiver are ran on the `Ground` object.

# Ground object

The `Ground` object starts as a clone of `Object`. It is the object which all unbound events (events not raised on a particular object) are forwarded to and all unbound objects (objects not specified in the context of another object) are defined.

# Defining objects

To set `A` as a copy of `B`:
    A: B

To add new events to `A` that are not in `B` while defining the object:
    A: B {
      foo: Event {
        "hai"
      }
    }

To add create a new object, and add new events later:
    A: B {
      foo: Event {
        "hai"
      }
    }
     
    A {
      bar: Event {
        "thar"
      }
    }

# Properties

A property, also known by about a million other names, is a variable which references an object.  There are no other variables in TDL.

Properties are per-object, since code is never actually executed outside of events (the obvious limitations of this are mentioned in "Object Initialization").
    A: Object {
      b: Event {
        asdf = "fdsa"
      }
    }

# Object Initialization

The `init` event is called when the object is created. The object is created as it is found in the code, when the program starts.

For instance, in the following example, `A` is created before `B`.
    A: Object {
      init: Event {
        foo = "bar"
      }
    }

    B: Object {
      init: Event {
        bar = "asdf"
      }
    }

# this, This, parent, and Parent

`this` returns a reference to the current object.
    A: Object {
      foo: Event {
        "meep"
      }
      b: Event {
        this foo() // calls `A foo`
      }
    }

`This` returns a clone of the current object.
    B: Object {
      clone: Event {
        This // returns a clone of `A`
      }
    }

`parent` returns a reference to the object the current object is a clone of.
    C: Object {
      p: Event {
        parent // I couldn't think of a real use for this, but it fits with this/This
      }
    }

`Parent` returns a clone of the object the current object is a clone of.
    D: Object {
      reset: Event {
        this = Parent /* replace the current object with a new clone of
                         the object was a clone of, `Object` in this case */*!!!!! REMOVE THIS !!!!! Added because geany is weird at highlighting markdown
      }
    }

# Object

All objects inherit from Object. 
    Object {
      foo: Event {
        // "foo" can be run on all objects
      }
    }


# Special syntax

Any object following a colon is considered an object or attribute reference.

The original reasoning for adding this was to allow for objects that would otherwise be interpreted as numbers.
    A: Object {
      init: Event {
        FOO = "meep"
        001 = "meep" // unambiguous enough to not require a leading colon
        FOO print() // this is the same as just `FOO`
      }
      2: Event { // unambiguous enough to not requrie a leading colon
        :001 print() // ambiguous enough to require a colon, the `001` could be a number
      }
      3: Event { // unambiguous enough to not requrie a leading colon
        print(:001) // ambiguous enough to require a colon, the `001` could be a number, this is the same as calling `Ground print(:001)`
      }
    }
