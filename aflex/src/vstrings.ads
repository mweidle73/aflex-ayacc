
with TEXT_IO; use TEXT_IO;
generic
  LAST : NATURAL;
package VSTRINGS is

  subtype STRINDEX is NATURAL;
  FIRST : constant STRINDEX := STRINDEX'FIRST + 1;
  type VSTRING is private;
  NUL : constant VSTRING;

-- Attributes of a VSTRING

  function LEN(FROM : VSTRING) return STRINDEX;
  function MAX(FROM : VSTRING) return STRINDEX;
  function STR(FROM : VSTRING) return STRING;
  function CHAR(FROM: VSTRING; POSITION : STRINDEX := FIRST)
                return CHARACTER;

-- Comparisons

  function "<" (LEFT: VSTRING; RIGHT: VSTRING) return BOOLEAN;
  function ">" (LEFT: VSTRING; RIGHT: VSTRING) return BOOLEAN;
  function "<=" (LEFT: VSTRING; RIGHT: VSTRING) return BOOLEAN;
  function ">=" (LEFT: VSTRING; RIGHT: VSTRING) return BOOLEAN;
  -- "=" and "/=" are predefined

-- Input/Output

  procedure PUT(FILE : in FILE_TYPE; ITEM : in VSTRING);
  procedure PUT(ITEM : in VSTRING);

  procedure PUT_LINE(FILE : in FILE_TYPE; ITEM : in VSTRING);
  procedure PUT_LINE(ITEM : in VSTRING);

  procedure GET(FILE : in FILE_TYPE; ITEM : out VSTRING;
                LENGTH : in STRINDEX := LAST);
  procedure GET(ITEM : out VSTRING; LENGTH : in STRINDEX := LAST);

  procedure GET_LINE(FILE : in FILE_TYPE; ITEM : in out VSTRING);
  procedure GET_LINE(ITEM : in out VSTRING);

-- Extraction

  function SLICE(FROM: VSTRING; FRONT, BACK : STRINDEX) return VSTRING;
  function SUBSTR(FROM: VSTRING; START, LENGTH: STRINDEX) return VSTRING;
  function DELETE(FROM: VSTRING; FRONT, BACK : STRINDEX) return VSTRING;

-- Editing

  function INSERT(TARGET: VSTRING; ITEM: VSTRING;
                  POSITION: STRINDEX := FIRST) return VSTRING;
  function INSERT(TARGET: VSTRING; ITEM: STRING;
                  POSITION: STRINDEX := FIRST) return VSTRING;
  function INSERT(TARGET: VSTRING; ITEM: CHARACTER;
                  POSITION: STRINDEX := FIRST) return VSTRING;

  function APPEND(TARGET: VSTRING; ITEM: VSTRING; POSITION: STRINDEX)
                  return VSTRING;
  function APPEND(TARGET: VSTRING; ITEM: STRING; POSITION: STRINDEX)
                  return VSTRING;
  function APPEND(TARGET: VSTRING; ITEM: CHARACTER; POSITION: STRINDEX)
                  return VSTRING;

  function APPEND(TARGET: VSTRING; ITEM: VSTRING) return VSTRING;
  function APPEND(TARGET: VSTRING; ITEM: STRING) return VSTRING;
  function APPEND(TARGET: VSTRING; ITEM: CHARACTER) return VSTRING;

  function REPLACE(TARGET: VSTRING; ITEM: VSTRING;
                   POSITION: STRINDEX := FIRST) return VSTRING;
  function REPLACE(TARGET: VSTRING; ITEM: STRING;
                   POSITION: STRINDEX := FIRST) return VSTRING;
  function REPLACE(TARGET: VSTRING; ITEM: CHARACTER;
                   POSITION: STRINDEX := FIRST) return VSTRING;

  function TRANSFORM(FROM : VSTRING) return STRING;

-- Concatenation

  function "&" (LEFT: VSTRING; RIGHT : VSTRING) return VSTRING;
  function "&" (LEFT: VSTRING; RIGHT : STRING) return VSTRING;
  function "&" (LEFT: VSTRING; RIGHT : CHARACTER) return VSTRING;
  function "&" (LEFT: STRING; RIGHT : VSTRING) return VSTRING;
  function "&" (LEFT: CHARACTER; RIGHT : VSTRING) return VSTRING;

-- Determine the position of a substring

  function INDEX(WHOLE: VSTRING; PART: VSTRING; OCCURRENCE : NATURAL := 1)
                 return STRINDEX;
  function INDEX(WHOLE : VSTRING; PART : STRING; OCCURRENCE : NATURAL := 1)
                 return STRINDEX;
  function INDEX(WHOLE : VSTRING; PART : CHARACTER; OCCURRENCE : NATURAL := 1)
                 return STRINDEX;


  function RINDEX(WHOLE: VSTRING; PART: VSTRING; OCCURRENCE : NATURAL := 1)
                 return STRINDEX;
  function RINDEX(WHOLE : VSTRING; PART : STRING; OCCURRENCE : NATURAL := 1)
                 return STRINDEX;
  function RINDEX(WHOLE : VSTRING; PART : CHARACTER; OCCURRENCE : NATURAL := 1)
                 return STRINDEX;

-- Conversion from other associated types

  function VSTR(FROM : STRING) return VSTRING;
  function VSTR(FROM : CHARACTER) return VSTRING;
  function "+" (FROM : STRING) return VSTRING;
  function "+" (FROM : CHARACTER) return VSTRING;

  generic
    type FROM is private;
    type TO is private;
    with function STR(X : FROM) return STRING is <>;
    with function VSTR(Y : STRING) return TO is <>;
   function CONVERT(X : FROM) return TO;

pragma PAGE;

  private
    type VSTRING is
      record 
        LEN : STRINDEX := STRINDEX'FIRST;
        VALUE : STRING(FIRST .. LAST) := (others => ASCII.NUL);
      end record;
 
    NUL : constant VSTRING := (STRINDEX'FIRST, (others => ASCII.NUL));
end VSTRINGS;
--
-- .......................................................................... --
--
-- DISTRIBUTION AND COPYRIGHT:
--                                                           
-- This software is released to the Public Domain (note:
--   software released to the Public Domain is not subject
--   to copyright protection).
-- Restrictions on use or distribution:  NONE
--                                                           
-- DISCLAIMER:
--                                                           
-- This software and its documentation are provided "AS IS" and
-- without any expressed or implied warranties whatsoever.
-- No warranties as to performance, merchantability, or fitness
-- for a particular purpose exist.
--
-- Because of the diversity of conditions and hardware under
-- which this software may be used, no warranty of fitness for
-- a particular purpose is offered.  The user is advised to
-- test the software thoroughly before relying on it.  The user
-- must assume the entire risk and liability of using this
-- software.
--
-- In no event shall any person or organization of people be
-- held responsible for any direct, indirect, consequential
-- or inconsequential damages or lost profits.
