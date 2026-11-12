<?xml version="1.0" encoding="UTF-8"?>
<!--
  2.6 Text output: a plain-text programme for the email

  The heading and the sorting are done already. We want each session to come out
  on its own line, like this:
    2026-11-12  09:05–09:50  Mini-tutorial: Dealing with whitespace ... (L016)

  TODO 1: In the session template, output the start time, a space, and the title:
            <xsl:value-of select="@start"/> <xsl:value-of select="title"/>
          Run it. How does it look?
          
  TODO 2: Fix the space in between the two value-ofs.
  
  TODO 3: End each session with a line break! 
  
  TODO 4: Now do the whole line in one go. Replace everything in the session
          template with a single xsl:text that uses curly brackets.
          Compare the output with the example above.

-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" expand-text="yes">

  <xsl:output method="text"/>

  <xsl:template match="/programme">
    <xsl:text>DECLARATIVE AMSTERDAM 2026&#10;&#10;</xsl:text>
    <xsl:apply-templates select="session">
      <xsl:sort select="@date"/>
      <xsl:sort select="@start"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="session">
    <!-- TODO 1 to 4 go here -->
    
  </xsl:template>

</xsl:stylesheet>
