
\version "2.18.2"

\header {
  title =  \markup {  \override #'(font-name . "Copperplate") \fontsize # 3 \bold"Susie’s Fiddle Tune"}
  subtitle =  \markup { \roman \fontsize #-1.5  " "}
  poet = \markup \center-column{
    \line {   \override #'(font-name . "Gill Sans Bold ") \tiny \bold "[ gDGBD ]"}
  }

  composer =  \markup {\right-align \fontsize # -1.5 "From Gilbert Monroe - Fairbanks, Alaska - Arr. JLouis Thiry"}
  enteredby = "Jean Louis Thiry"
  tagline = \markup \center-column {
    \line {
      \fontsize # 1  \bold  "+" \fontsize # -2 \italic "Pouce"
      \fontsize # 2   \bold " ." \fontsize # -2 \italic "Index"
      \fontsize # 2   \bold "  .." \fontsize # -2 \italic "Majeur"
      \fontsize # -2    "  ▲" \fontsize # -3 \italic "Arpège"
      \fontsize # -2   \bold "  Po" \fontsize # -2 \italic "Pull off"
      \fontsize # -2   \bold "  H" \fontsize # -2 \italic "Hammer on"}
  }
  % copyright = \markup \center-column {  \fontsize #-3  \italic  "Copyright reserved by the composer" }
  copyright = \markup \center-column {
    \line {
      \fontsize #-3  \italic  \vspace # 0 \fontsize #-2.5 \override #'(font-name . "Palatino")
      "Lilyponded in Montauban on"  \fontsize #-2.5  \override #'(font-name . "Palatino")
      \simple #(strftime "%m.%d.%Y," (localtime (current-time))) \with-url #"thiryjl@icloud.com/"
      \override #'(font-name . "Palatino") \fontsize #-2.5 "by © Jean Louis Thiry" }
  }
}

\paper {
  #(set-paper-size "a4")
  #(include-special-characters)
  top-markup-spacing #'basic-distance = #0
  markup-system-spacing.basic-distance  = #18			%espace entre titre et partition
  top-system-spacing.basic-distance = #5
  system-system-spacing.basic-distance  = #15
  last-bottom-spacing.basic-distance = #20
  two-sided = ##t
 outer-margin = 1.5\cm			% For even total pages = 0.5, otherwise 0.7
  inner-margin  = 1.5\cm			% For even total pages = 0.7, otherwise 0.5
  top-margin = 1.5\cm
  bottom-margin = 1\cm
  ragged-last-bottom = ##t		% False = evenly spread over pages;  True = compact with trailing white space
  evenHeaderMarkup = \markup {
    \fill-line {
      \on-the-fly #print-page-number-check-first {
        \fromproperty #'header:title
        \fromproperty #'page:page-number-string
        \fromproperty #'header:instrument
      }
    }
  }
  oddHeaderMarkup = \evenHeaderMarkup
}


% /////////////////////////// Macros ////////////////////////////////////////////////////////////////////

ffz = #(make-dynamic-script "ffz")
mf-f = #(make-dynamic-script "mf-f")
fz = #(make-dynamic-script "fz")
p-f = #(make-dynamic-script "p-f")
sl = \glissando  ^\markup {\italic \fontsize #-1 "slide"}
% \tweak Stem.length  #3					%pour les hampes sur la 4° corde

A =   \mark \markup { \left-align \hspace #2 \fontsize #-1.75 \box \bold A}
B =   \mark \markup {      \hspace # 3  \fontsize #-1.75 \box \bold  "B" }
C =   \mark \markup { \hspace # 0.5 \fontsize #-1.75 \box \bold C }
PB =  \mark \markup { \raise #2  \hspace #0 \bold \tiny  \ellipse {   \pad-markup #.5 { 12PB }}  }


% /////////////////////////// Doigtés ////////////////////////////////////////////////////////////////////

#(define RH rightHandFinger)		% -\RH #1,2,3 - allows right hand notation			% Slide
sfor = \set fingeringOrientations = #'(right)
sfo = \set fingeringOrientations = #'(left)

T = _\markup  \center-column {  \vspace #1.2 \normal-text  \center-align  "+"}
I = _\markup  \center-column { \vspace #1.1  \huge \center-align "."}
M = _\markup  \center-column {  \vspace #1 \center-align  \huge  ".."}

TI = \I \T
TM = \M \T
IM = \M \I
TIM = \M \I \T
TTIM = \M \I \T \T
S = _\markup \column {    \center-align \vspace #1.2  \fontsize #-2.5   "▲"}
TR = -\tweak #'style #'trill \glissando
ARP = \tweak #'style #'dashed-line \glissando
PO 	= ^\markup  \column { \left-align  \vspace #1.2  \override #'(font-name . "sans") \normal-text \fontsize #-2.5    "Po"  }
H 	= ^\markup  \column { \left-align  \vspace #1.2  \override #'(font-name . "sans") \normal-text \fontsize #-2.5    "H"    }

% /////////////////////////// Global settings ///////////////////////////////////////////////////////////////
global = {
  \override Staff.TabNoteHead.font-name = #"Trebuchet MS Bold"		% Police tablature
  \override Staff.TabNoteHead.font-size = # -.75
  \time6/8					% Time Signature
  \key g \major					% Key
  \partial 8
 \override TupletBracket.bracket-visibility = ##t
  \tupletUp  \sfo						% orientation des numéros de doigts
  %\clef "treble_8"
}

% ///////////////////////////  Chords go here /////////////////////////////////////////////////////////////////
chordlist = \chordmode {


  \override ChordNames.ChordName.font-size = #-2
  \override ChordName #'font-series = #'bold
  \set chordChanges = ##t
s8
g4.*7
d4.
g4.*6
d4.	g
d4.	g

g4.*7	d4.
g4.*6
d4.	g4.*8
d4.
g4.*6
d4.	g
}
% ///////////////////////////  Notes go here /////////////////////////////////////////////////////////////////
melody =  \relative c' {
\override Score.MetronomeMark.direction = #DOWN
\override Score.VoltaBracket #'edge-height = #'(2.0 . 0)
    \override Score.VoltaBracketSpanner #'Y-extent = #'(0 . 0)
\override Score.VoltaBracketSpanner #'padding = #0  % Default = 1.0
\tempo 4 = 138
\time 6/8
\key g \major
 \repeat volta 2{
 \partial  8*1 \A b16\2( c\2\H) | % 1

 d8\I b\2\T d\I g\I fis\2\T e\2\I | % 2
 d8\I b\2\T c\3\I d8\I g\5\T b,16\2\I( c\2\H) | % 3
 d8 b \2 d g fis \2 e \2 | % 4
 d8 b \2 g \3 a8\3 g'\5\T b,16 \2 c \3 | % 5
 d8  b \2 d g fis \2 e \2 | % 6
 d8 b \2 c \3 d4 d8 | % 7
 d8 e \3 fis \2 g\2\I d\S b\2\T | } % 8
 \alternative {
   { a8\3\I  b\2\S a\3\T a4\3\I  s8 | } % 9
   { a8\3\I  b\2\S a\3\T g4\3\I  d'8 \bar "|." |} % 10
   }
{ \B
  b'8 a \2 g \2 d b \2 a \3 | % 11
 g8\3\I (a\3\H) b\2\I d b \2 d | % 12
 b'8 a \2 g \2 d b \2 a \3 | % 13
 g8\3\I (a\3\H) b\2\I a4 \3  d8 | % 14
 b'8  a \2 g \2 d b \2 a \3 | % 15
 g8\3\I (a\3\H) b\2\I d\I b\2\T d\I | % 16
 d8\I e\3\T fis\2\I g\2\I d\S b\2\T | % 17
 a8\3\I  b\2\S a\3\T g4\3\I  d'8 \bar  "||" % 18
 \C
 g8\2\I d\S g\2\T  d'\I \PB b\2\T g\2\I | % 19
 e8\3\I fis\2\S g\5\T d4\I d8\I   % 20
 g8\2\I d\S g\2\T d'\I  b\2\T g\2\I  | % 21
 e8\3\I fis\2\S g\5\T <fis \2 a>  s d | % 22
 g8\2\I  d\S g\2\T d'\I  b\2\T  g\2\I   | % 23
 e8\3\I fis\2\S g\5\T d4\I d8\I  | % 24
 e8\2\I fis\S g\5\T d b \2 g \3 | % 25
 a8\3\I ( b\2\PO) a\3\T g4\3\I  s8 \bar "|." | % 26
 }
}


% /////////////////////////// The score /////////////////////////////////////////////////////////////////
\score {
  \new StaffGroup = "tab with traditional"
  <<
    \chords  {
      \override VerticalAxisGroup.
      nonstaff-relatedstaff-spacing.padding = #1.5
      \override VerticalAxisGroup.
      nonstaff-unrelatedstaff-spacing.padding = #1


      \set chordChanges = ##t						% Only print chord when it changes.
      \chordlist									% Chords
    }
    %\set StaffGroup.instrumentName = "Banjo"
    % \override StaffGroup.SystemStartBracket.collapse-height = #1
    % adds bracket even for single bar
    %\override Score.SystemStartBar.collapse-height = #1
    % add start bar even for single bar


    % /////////////////////////// Comment out from here to >> to remove traditional notation.////////////////////

    %      \new Staff = "banjo traditional"
    % <<
    %      \set Staff.midiInstrument = #"banjo"
    %      \set strokeFingerOrientations = #'(down)
    %     {
    %      \accidentalStyle forget
    %      \compressFullBarRests		% Multi bars rest compressed to one bar.
    %      \stemUp 					% Stems are all up on traditional notation.
    %      \clef "treble_8"				% G-clef dropped by one octave
    %      \global					% global variables
    %      \melody					% Music
    %     }
    % >>

    % /////////////////////////// Comment out from here to >> to remove tablature notation.////////////////////

    \new TabStaff \with { \consists "Volta_engraver" } %= "banjo tab"

    <<
      \set TabStaff.tablatureFormat = #fret-number-tablature-format-banjo
      \set TabStaff.stringTunings = \stringTuning <  g' d g b d' >
      \set Staff.midiInstrument = #"banjo"

      % \set strokeFingerOrientations = #'(down)		% SFO
      %\set TabStaff.minimumFret = #0				% This allows capoing
      \override Staff.Clef.stencil = ##f
      \override Stem.length = # 5
      \override Beam.damping = # +inf.0  				% makes all beams level
      \override Beam.positions = #'(-3.5 . -3.5)

      {
        \compressFullBarRests						% Multi bars rest compressed to one bar.
        \tabFullNotation 							% Tab gets stems and rests
        \stemDown								% Stems are all down on tablature
        \global									% global variables
        \melody									% Music
      }
    >>
  >>

  \layout {
    indent = #0
    \override Score.MetronomeMark.self-alignment-X = #-1.5
    \override Score.MetronomeMark.padding = #2
    \override Score.MetronomeMark.font-size = #-1.5
    \context {
      \Score
      \remove "Bar_number_engraver"
       \remove "Volta_engraver"
    }


    \context {
      \Score
      % Remove string numbers (as tablature includes that inforamtion.
      % \override StringNumber.transparent = ##t
      % set right hand digit names
      % \override StrokeFinger.digit-names = ##("t" "i" "m" "" "")
      % Adjust the final number below to change spacing between notes.
      % 32 means smallest note is assumed to be a 32nd note.
      % \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/32)
    }
  }
  \midi {  }									% Produce a midi file of the music.
}

#(set-global-staff-size 18)
