<?xml version="1.0" encoding="UTF-8"?>
<!--
  1.4 Identity transform

  Problem: the team wants the programme as XML, without the speakers'
           emails or internal notes.

  TODO 1: Write the identity template below and run it.
          Is the output the same as the input?

            <xsl:template match="@* | node()">
              <xsl:copy>
                <xsl:apply-templates select="@* | node()"/>
              </xsl:copy>
            </xsl:template>

  TODO 2: Add an empty template that matches email and notes
          <xsl:template match="email | notes"/>
          
  TODO 3: Now the XSLT 3.0 way! Delete your identity template and put this line in
          its place.
            <xsl:mode on-no-match="shallow-copy"/>

          Run it again. Is the output the same?

  EXTRAS:
    - Rename <notes> to <internal> instead of removing it. Take notes out of the
      empty template so it only matches email, and add a new template that renames it.
      (hint: <internal><xsl:apply-templates/></internal> )  

-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- How the result is written out. More about this in 1.5. -->
  <xsl:output method="xml" indent="yes"/>

  <!-- This removes the whitespace between the input's tags, so no blank lines
       are left where the emails and notes were. -->
  <xsl:strip-space elements="*"/>

  <!-- TODO 1 goes here -->

  <!-- TODO 2 goes here -->

</xsl:stylesheet>
