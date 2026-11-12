<?xml version="1.0" encoding="UTF-8"?>
<!--
  1.7 Conditions

  Problem: some speakers have an affiliation. We want it in brackets after their
  name, but only when there is one. And above the speakers we want "Speaker:"
  or "Speakers:".
  
  TODO 1: Show the speakers <affiliation> in brackets after the name, 
          like: "Jennifer Ramirez (ZB MED)" 

  TODO 2: Above the speakers, add "Speaker:" or "Speakers:", but only for sessions
          that have speakers:
          (hint: you can use <xsl:if>

  EXTRAS:
    - What other ways could you complete TODO 2? Which is easiest to read?
-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" expand-text="yes">

  <xsl:output method="html" version="5"/>

  <xsl:template match="/programme">
    <html>
      <head>
        <title>Declarative Amsterdam 2026</title>
      </head>
      <body>
        <h1>Declarative Amsterdam 2026</h1>
        <!-- Pull: a regular list, so for-each works well -->
        <h2>Overview</h2>
        <ul class="overview">
          <xsl:for-each select="session">
            <li>{@start}: {title}</li>
          </xsl:for-each>
        </ul>
        <xsl:apply-templates select="session"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="session">
    <div class="session">
      <h2>{title}</h2>
      <p>{@date}, {@start}-{@end}, at {@room}</p>
      <!-- TODO 2: the speaker label goes here -->
      
      <xsl:apply-templates select="speaker"/>
      <xsl:apply-templates select="abstract"/>
    </div>
  </xsl:template>

  <xsl:template match="speaker">
    <p class="speaker">{name}<!-- TODO 1 --></p>
  </xsl:template>

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

  <!-- TODO 1: the affiliation template goes here -->

</xsl:stylesheet>
