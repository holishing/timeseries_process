c-----------------------------------------------------------------------
      subroutine int2char(a,b)
c-------------------------------------------------------------
c  change integer to character (1-99)
c-------------------------------------------------------------
      integer a
      character b*2

      if (a==0)  b='00'
      if (a==1)  b='01'
      if (a==2)  b='02'
      if (a==3)  b='03'
      if (a==4)  b='04'
      if (a==5)  b='05'
      if (a==6)  b='06'
      if (a==7)  b='07'
      if (a==8)  b='08'
      if (a==9)  b='09'
      if (a==10) b='10'
      if (a==11) b='11'
      if (a==12) b='12'
      if (a==13) b='13'
      if (a==14) b='14'
      if (a==15) b='15'
      if (a==16) b='16'
      if (a==17) b='17'
      if (a==18) b='18'
      if (a==19) b='19'
      if (a==20) b='20'
      if (a==21) b='21'
      if (a==22) b='22'
      if (a==23) b='23'
      if (a==24) b='24'
      if (a==25) b='25'
      if (a==26) b='26'
      if (a==27) b='27'
      if (a==28) b='28'
      if (a==29) b='29'
      if (a==30) b='30'
      if (a==31) b='31'
      if (a==32) b='32'
      if (a==33) b='33'
      if (a==34) b='34'
      if (a==35) b='35'
      if (a==36) b='36'
      if (a==37) b='37'
      if (a==38) b='38'
      if (a==39) b='39'
      if (a==40) b='40'
      if (a==41) b='41'
      if (a==42) b='42'
      if (a==43) b='43'
      if (a==44) b='44'
      if (a==45) b='45'
      if (a==46) b='46'
      if (a==47) b='47'
      if (a==48) b='48'
      if (a==49) b='49'
      if (a==50) b='50'
      if (a==51) b='51'
      if (a==52) b='52'
      if (a==53) b='53'
      if (a==54) b='54'
      if (a==55) b='55'
      if (a==56) b='56'
      if (a==57) b='57'
      if (a==58) b='58'
      if (a==59) b='59'
      if (a==60) b='60'
      if (a==61) b='61'
      if (a==62) b='62'
      if (a==63) b='63'
      if (a==64) b='64'
      if (a==65) b='65'
      if (a==66) b='66'
      if (a==67) b='67'
      if (a==68) b='68'
      if (a==69) b='69'
      if (a==70) b='70'
      if (a==71) b='71'
      if (a==72) b='72'
      if (a==73) b='73'
      if (a==74) b='74'
      if (a==75) b='75'
      if (a==76) b='76'
      if (a==77) b='77'
      if (a==78) b='78'
      if (a==79) b='79'
      if (a==80) b='80'
      if (a==81) b='81'
      if (a==82) b='82'
      if (a==83) b='83'
      if (a==84) b='84'
      if (a==85) b='85'
      if (a==86) b='86'
      if (a==87) b='87'
      if (a==88) b='88'
      if (a==89) b='89'
      if (a==90) b='90'
      if (a==91) b='91'
      if (a==92) b='92'
      if (a==93) b='93'
      if (a==94) b='94'
      if (a==95) b='95'
      if (a==96) b='96'
      if (a==97) b='97'
      if (a==98) b='98'
      if (a==99) b='99'
      return
      end