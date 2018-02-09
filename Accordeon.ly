\version "2.18.2"

\include "snippets/adjust-horizontal-spacing/module.ily"

\header {
  title =  \markup {  \vspace#0 \override #'(font-name . "Optima Bold") \fontsize # 5 \bold"ACCORDÃON"}		%Titre
  subtitle =  \markup
  \center-column {
    { \fontsize # -1 \roman \vspace#1 \raise#2 \italic "Paroles et musique de Serge Gainsbourg"}
  }



  enteredby = "Jean Louis Thiry"			% Person who created this lilypond file
  copyright  = \markup \center-column {
    \line {
      \fontsize #-3  \italic  \vspace # 0 \fontsize #-2.5 \override #'(font-name . "Palatino")
      "Copyright Â© 1962 by BAGATELLE Editions Musicales 35, rue de Washington 75008 Paris TeL 256 21 94"
    }  \line {
      \fontsize #-2.5  \override #'(font-name . "Palatino")
      \fontsize #-2.5 "Tous droits rÃ©servÃ©s pour tous pays"
    }
  }
  tagline = \markup \center-column {
    \line {
      \fontsize #-3  \italic  \vspace # 0 \fontsize #-2.5 \override #'(font-name . "Palatino")
      "Lilyponded in Montauban on"  \fontsize #-2.5  \override #'(font-name . "Palatino")
      \simple #(strftime "%m.%d.%Y," (localtime (current-time))) \with-url #"thiryjl@icloud.com/"
      \override #'(font-name . "Palatino") \fontsize #-2.5 "by Â© Jean Louis Thiry"
    }
  }
}



\paper {

  #(set-paper-size "a4")
  #(include-special-characters)
  ragged-right = ##f
  % ragged-bottom = ##f
  ragged-last-bottom = ##t

  % Espace entre le bas de la marge haute et le milieu du premier systÃ¨me
  % s'il n'y a pas de titre ou de markup en haut de page
  top-system-spacing = #'((padding . 1)
                          (basic-distance . 26)
                          (minimum-distance . 4)
                          (stretchability . 0))

  % Espace entre le bas de la marge haute et le premier titre ou markup
  % s'il n'y a pas de systÃ¨me en haut de page
  top-markup-spacing = #'((padding . 0)
                          (basic-distance . 0)
                          (minimum-distance . 6)
                          (stretchability . 0))

  % Espace entre un titre ou un markup et le systÃ¨me qui le suit
  markup-system-spacing  = #'((padding . 1)
                              (basic-distance . 20)
                              (minimum-distance . 10)
                              (stretchability . 12))

  % Espace entre deux titres ou markups
  markup-markup-spacing = #'((padding . 1)
                             (basic-distance . 4)
                             (minimum-distance . 2)
                             (stretchability . 0))

  % Espace entre un systÃ¨me et le titre ou le markup qui le suit
  score-markup-spacing  = #'((padding . 1)
                             (basic-distance . 18)
                             (minimum-distance . 16)
                             (stretchability . 12))

  % Espace entre le dernier systÃ¨me ou le dernier markup et le haut de la marge du bas
  last-bottom-spacing  = #'((padding . 1)
                            (basic-distance . 15)
                            (minimum-distance . 10)
                            (stretchability . 16))

  % ajuster l'espacement entre 2 systÃ¨mes
  system-system-spacing.basic-distance = 10
  two-sided = ##t
  inner-margin = 1.5\cm							% For even total pages = 0.5, otherwise 0.7
  outer-margin = 1.5\cm							% For even total pages = 0.7, otherwise 0.5
  top-margin = 1\cm
  bottom-margin = 1\cm
  page-count = 2

}

% /////////////////////////// Macros ////////////////////////////////////////////////////////////////////

ffz = #(make-dynamic-script "ffz")
mf-f = #(make-dynamic-script "mf-f")
fz = #(make-dynamic-script "fz")
p-f = #(make-dynamic-script "p-f")
p-f = #(make-dynamic-script "p-f")

% /////////////////////////// Global settings  ////////////////////////////////////////////////////////////////////

global = {
  \key g \minor
  \time 3/4
  \tempo   "TÂ° di java"
  %\partial 4


}

% ////////////////////////////////// Paroles //////////////////////////////////
text = \lyricmode {
  \override Lyrics.LyricText.font-size = #-.5

  \set stanza = #"1. " Dieu que la vie est cru -- el -- le Au mu -- si -- cien des ru -- el -- les Son co -- pain son com -- pa -- gnon C'est l'ac -- cor -- dÃ© -- on Qui c'est -- y qui l'aide a vi -- vre A s'as -- seoir quand il s'Ã©n -- i -- vre C'est -- y vous, c'est moi, mais non C'est l'ac -- cor -- dÃ© -- on Ac -- cor -- dez ac -- cor -- dez ac -- cor -- dez donc L'au -- mÃ´ne Ã  l'ac -- cor -- dÃ© l'ac -- cor -- dÃ© -- on  \set stanza = #"2. " Ils sont
}

texta = \lyricmode {
  \override Lyrics.LyricText.font-size = #-.5
  % \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"2. " Ils sont comm' cul et che -- mi -- se et quand on les ver -- ba -- li -- se Il ac -- com -- pagne au vio -- lon Son ac -- cor -- dÃ© -- on Il pass' u -- ne nuit tran -- quil -- le Puis au ma -- tin il re -- fi -- le Un peu d'air dans les pou -- mons De l'ac -- cor -- dÃ© -- on  \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2.  \set stanza = #"3. " Quand par
}

textb = \lyricmode {
  \override Lyrics.LyricText.font-size = #-.5
  % \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"3. " Quand par -- fois il lui mas -- sa -- cre Ses pe -- tits bou -- tons de na -- cre Il en fauche Ã  son ves -- ton Pour l'ac -- cor -- dÃ© -- on Lui em -- prun -- te ses bre -- tel -- les Pour se -- cou -- rir la fi -- cel -- le Qui re -- tient ses pan -- ta -- lons en ac -- cor -- dÃ© -- on  \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2. \skip2.  \set stanza = #"4. " Mais un
}

textc = \lyricmode {
  \override Lyrics.LyricText.font-size = #-.5
  % \override Lyrics.LyricText.font-shape = #'italic
  \set stanza = #"4. " Mais un jour par las -- si -- tude Il lais -- se -- ra la so -- li -- tu -- de Se poin -- ter Ã  l'ho -- ri -- zon De l'ac -- cor -- dÃ© -- on Il en ti -- re -- ra cin -- quan -- te Cen -- ti -- mes Ã  la bro -- cante et on fe -- ra plus at -- ten -- tion A l'ac -- cor -- dÃ© -- on
}
% ////////////////////////////////// Accords //////////////////////////////////

chordNames =   \transpose g e
 \chordmode
{
  \override ChordNames.ChordName.font-size = #-2
  \override ChordName #'font-series = #'bold
  \set chordChanges = ##t
  \textLengthOn

  g2.:m
  c2.:m
  d2.:m7
  g2.*2:m
  c2.:m
  d2.:m7

  g2.*3:m
  es2.*2:7

  c2.:m
  f2.*2:7
  bes2.
  g2.*2:m
  es2.:dim
  es2.:7
  g2.:m
  a2.:7
  c4:m
  d4*2:m7
  g2.:m
  es2.*3
  bes2.
  aes2.
  g4:m d4:7 g4:m
  d2.:7
  g2.:m
  d2.:7
  g2.:m
  d2.:7
  g2.:m

}

% ////////////////////////////////// MÃ©lodie //////////////////////////////////

melody =   \transpose g e'
 {
  \override Score.VoltaBracket #'edge-height = #'(2.0 . 0)
  \override Score.VoltaBracketSpanner #'Y-extent = #'(0 . 0)
  \override Score.VoltaBracketSpanner #'padding = #0
  \clef "G_8"
  \global
  %\stemUp
  \textLengthOn


  s2.*7
  r4 r g8 g
  \repeat volta 4 {
    bes8 bes a4 bes
    a4 g g8 g
    bes8 bes a4 bes
    a4 g g8g
    bes8 bes a4g4
    a2.
    g8 a g4 f
    d4 r g8 g
    bes8 bes a4 bes
    a4 g g8 g
    bes8 bes a4 bes|
    a4 g g8 g
    bes8 bes a4 g
    a2.
    g8 a g4 f
    g2 r4 \bar "||"
    \mark \markup { \bold \fontsize #-3 "REFRAIN"}
    g4 g g
    g4 g g
    g4 bes g
    f2. \break
    es4 aes es
    d4 d d
    fis4 fis fis
    g4 r r
  }

  \alternative {
    {
      r2. |
      r4 r g8 g |
    } %
    {
      r2. |
      r2. |\bar "|."
    } %
  }
}

% ////////////////////////////////// Piano MD //////////////////////////////////

upper =   \transpose g e'
 {
  \clef "G_8"
  \global
  <bes d'>8.\f[ <a c'>16 <g bes>8.  <a c'>16] <bes d'>4 |
  <c' es'>4 <a c'>4 r4 |
  \stemDown<a c'>8.[ <g bes>16 <fis a>8. <g bes>16] <a c'>8. <fis a>16  |
  <bes d'>2.        |
  <bes d'>8.[ <a c'>16 <g bes>8.  <a c'>16] <bes d'>4 |
  <c' ees'>4 <a c'> r |
  \tuplet 3/2 {a8 bes a } \tuplet 3/2 {g8 a g}  \tuplet 3/2 {fis8 g a } \break
  \stemNeutral g4 r <bes g>8\mf q

  \repeat volta 4 {
    <d bes>8 q <c a>4 <d bes>
    <c a>4 <bes, g> q8 q

    <<
      {
        bes8 bes a4 bes
        a4 g g8g
        bes8 bes a4g4
        a2.
        g8 a g4 f
      }\\{
        des2.~
        des
        <c es>2.
        <c es>2.
        <c es>2.
      }
    >>
    \break


    <bes, d>4 r <bes, g>8 q
    <d bes>8 q <c a>4 <d bes>
    <c a>4 <bes, g> <bes, g>8 q
    <<
      {
        bes8 bes a4 bes|
        a4 g g8 g
        bes8 bes a4 g
        a2.
        g8 a g4 f
        g2 b4\rest
      }\\{
        des2.~
        des
        d!2.
        <cis e! a>2.
        c!2.
        <bes, d>2
      }
    >>
    \break
    <bes, es g>4 q q
    q4 q q
    q4 <e g bes> <bes, es g>
    << { f2.  }\\{ \tuplet 3/2 {d8 es d } \tuplet 3/2 {c d c} \tuplet 3/2 {bes, c d}}>>
    \break
    <aes, c es>4 <c es aes> <aes, c es>
    <g, d>4 <a! d> <bes, d>
    <c d fis>4 q q
    <bes, d g>4 r bes8 bes \break
  }

  \alternative {
    {
      \tuplet 3/2 {a8 bes a} \tuplet 3/2 {g8 a g} \tuplet 3/2 {fis8 g a} |
      g4 r <bes, g>8 q |
    } %
    {
      \tuplet 3/2 {a8 bes a} \tuplet 3/2 {g8 a g} \tuplet 3/2 {fis8 g a} |
      g4 <bes d' g'>-> r |\bar "|."
    } %
  }


}


% ////////////////////////////////// Piano MG //////////////////////////////////

lower =   \transpose g e'
 {
  \clef bass
  \global
  g,4 r g,
  c,4 ees, g,
  d,4 r d,
  g,4 bes, d
  g,4 r g,
  c,4 ees, g,
  d,4 a, d
  g,4 g,, r

  g,4 r d,
  g,4 r g,
  es,4 r bes,,
  es,4 r es,
  c,4 r es,
  f,4 a, c
  f4 r f,

  bes,4 bes,, r
  g, r d,
  g, r f,
  e,! r e,

  es,!4 r es,
  g,4 a, bes,
  a,4 cis e!
  es!4 d d,
  g,4 g,, r

  es,4 r bes,,
  es,4 r bes,,
  es,4 r es,
  bes, c d

  c4 r aes,
  bes,4 a, g,
  a,4 r d,
  g,4 g,, r

  d,4 a, d
  g,4 g,, r
  d,4 a, d
  g,4 g,,^> r


}

% ////////////////////////////////// Score //////////////////////////////////

\score {
  <<
    \new ChordNames \with {
      \override VerticalAxisGroup.
      nonstaff-relatedstaff-spacing.padding = #2
      \override VerticalAxisGroup.
      nonstaff-unrelatedstaff-spacing.padding = #2
    }\chordNames

    \new Voice   = "mel" \with { \consists "Volta_engraver" } {
      \override Staff.VerticalAxisGroup.remove-first = ##t
      \set Staff.instrumentName = "" \autoBeamOff \melody

    }
    \new Lyrics \lyricsto mel \text
    \new Lyrics \lyricsto mel \texta
    \new Lyrics \lyricsto mel \textb
    \new Lyrics \lyricsto mel \textc
    \new PianoStaff <<
      \set PianoStaff.instrumentName = ""
      \new Staff = "upper" \upper
      \new Staff = "lower" \lower
    >>
  >>
  \layout {
    \override Score.MetronomeMark.self-alignment-X = #.8
    \override Score.MetronomeMark.padding = #2
    \override Score.MetronomeMark.font-size = #-1
    indent = #4
    \context {
      \Score
      \remove "Volta_engraver"
    }
    \context {
      \Staff \RemoveEmptyStaves
      % To use the setting globally, uncomment the following line:
      % \override VerticalAxisGroup.remove-first = ##t
    }


    \stretchHorizontalSpacing #-3
    %\override Score.BarNumber.break-visibility = #end-of-line-invisible
    %\set Score.currentBarNumber = #1     %numÃ©ros de toutes les mesures
    % \bar ""  % Permit first bar number to be printed
    %\set Score.barNumberVisibility = #(every-nth-bar-number-visible 1) % Print a bar number every N measure
    %   \context { \Staff \RemoveEmptyStaves }
  }
  \midi {
    \tempo  "Moderately slow" 4 = 180
  }
}

#(set-global-staff-size 18)
%#(set-global-font-size 18)