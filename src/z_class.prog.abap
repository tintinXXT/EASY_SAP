*&---------------------------------------------------------------------*
*& Report Z_CLASS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_class.

CLASS lcl_escola DEFINITION.

  PUBLIC SECTION. "Can be execute outside this section
    CLASS-DATA s_attribute TYPE i. "static attribute
    DATA i_atribute TYPE i.        "instance atribute
    CONSTANTS c_attribute TYPE i VALUE 2. "constant atribute



  ENDCLASS.
         WRITE :/ 'Value for static attribute is:', lcl_escola=>s_attribute,
                / 'Value for constant is:', lcl_escola=>c_attribute.
*         / 'vALUE for instance is:', lcl_escola=>i_atribute. ""Cannot print instance atribute using class name

"CREATE OBJECT FOR LOCAL CLASS

DATA l_ob1 TYPE REF TO lcl_escola. "this is required in order to write a instance
CREATE OBJECT l_ob1.

*Write :/ 'VALUE for instance is:', l_ob1=>i_atribute. "Syntax error, => not allowed
Write :/ 'VALUE for instance is (using  class object):', l_ob1->s_attribute,
/ 'VALUE for instance is (using  class object):', l_ob1->i_atribute,
/ 'VALUE for instance is(using  class object):', l_ob1->c_attribute.

l_ob1->s_attribute = 25.
l_ob1->i_atribute = 20.

Write :/ 'Attribute with value filled', l_ob1->s_attribute,
       /  'Attribute with value filled', l_ob1->i_atribute.

ULINE.

DATA l_ob2 TYPE REF TO lcl_escola.
CREATE OBJECT l_ob2.

Write :/ 'VALUE for instance is (using  class object 2):', l_ob2->s_attribute.
"The value  of the atribute remains the same independent of how many declaritions you have
