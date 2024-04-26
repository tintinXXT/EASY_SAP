*&---------------------------------------------------------------------*
*& Report Z_INCLUDE_STRUCTURE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_INCLUDE_STRUCTURE.

* o uso desse argument é para adicionar os dados da estrutura 1 dentro da dois sem ser unitario
DATA : BEGIN OF s_2,
       FIRST TYPE I,
       SECOND TYPE I,
  END OF s_2.

  DATA : BEGIN OF s_3,
     THIRD TYPE I,
     FORTH  TYPE I.
   INCLUDE STRUCTURE s_2. "Junta os campos da s_2 dentro da s_3"
   DATA : FITH TYPE I,
         END OF s_3.

 s_3-THIRD = 1000.
 s_3-FORTH = 1001.
*s_3-s_2-FIRST = 1000. "NÃO FUNCIONA"
 S_2-FIRST = 1002.
 S_2-SECOND = 1002.

 WRITE :/ 'S_3-THIRD',  s_3-THIRD,
        / 'S_3-THIRD',  s_3-FORTH,
        / 'S_2-FIRST',  s_2-FIRST,
        / 'S_2-SECOND', s_2-SECOND.
