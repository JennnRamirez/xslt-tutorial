<?xml version="1.0" encoding="UTF-8"?>
<!--
  2.2 Variables: how many sessions?

  Problem: the page should say how many sessions there are.

  TODO 1: At the start of the /programme template, before <html>, store the
          sessions in a variable:
            
  TODO 2: Under the h1, show the number of sessions in a readable way, like
          "28 sessions":
          (hint: you may need a count)
            
  TODO 3: Use your new variable($sessions) in the overview list's for-each and in the
          apply-templates for the session blocks too, instead of "session".
          The output doesn't change, but now all three places use the variable!

  TODO 4: Not every session is a talk. Some are breaks and openings.
          (In the XPath bar) Use distinct-values() to see which tracks there are. 
          
          Then, under the first variable, add a second one
          that keeps only the tutorials and symposium talks:
            <xsl:variable name="talks" select="$sessions[...]"/>
            
          Write the predicate yourself. Hint: it works like [@room = 'L016'],
          and you'll need "or". Then change the line under the h1 so it says
          "28 sessions, 19 talks and tutorials".

-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    expand-text="yes">

  <xsl:output method="html" version="5"/>

  <xsl:template match="/programme">
    <!-- TODO 1: the variable goes here -->

    <!-- TODO 4: the $talks variable goes here -->

    <html>
      <head>
        <title>Declarative Amsterdam 2026</title>
      </head>
      <body>
        <h1>Declarative Amsterdam 2026</h1>
        <!-- TODO 2: the number of sessions goes here -->

        <!-- TODO 3: use $sessions here -->
        <h2>Overview</h2>
        <ul class="overview">
          <xsl:for-each select="session">
            <li>{@start}: {title}</li>
          </xsl:for-each>
        </ul>
        <!-- TODO 3: and here -->
        <xsl:apply-templates select="session"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="session">
    <div class="session">
      <h2>{title}</h2>
      <p>{@date}, {@start}-{@end}, at {@room}</p>
      <xsl:if test="speaker">
        <p class="label">{if (count(speaker) eq 1) then 'Speaker:' else 'Speakers:'}</p>
      </xsl:if>
      <xsl:apply-templates select="speaker"/>
      <xsl:apply-templates select="abstract"/>
    </div>
  </xsl:template>

  <xsl:template match="speaker">
    <p class="speaker">{name}<xsl:apply-templates select="affiliation"/></p>
  </xsl:template>

  <!-- Only runs when there is an affiliation, so no test is needed -->
  <xsl:template match="affiliation"> ({.})</xsl:template>

  <!-- Push: hand the abstract's content to the rules -->
  <xsl:template match="abstract">
    <p class="abstract"><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="bold">
    <b><xsl:apply-templates/></b>
  </xsl:template>

  <xsl:template match="italics">
    <i><xsl:apply-templates/></i>
  </xsl:template>

</xsl:stylesheet>
