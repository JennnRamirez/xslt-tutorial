<?xml version="1.0" encoding="UTF-8"?>
<!--
  1.3 Your first stylesheet!

  TODO 1: Run the stylesheet as is. 
          What is the output? Where does it come from?

  TODO 2: Write some XPath to select the [1] title 
          (hint: <first-session><xsl:value-of select=""/></first-session>)
          Although there is an easier way to show this! 

          Which title do you get? Why that one?

  TODO 3: Change [1] to [2] (or [18]!) and run it again. Then try one of the paths from 1.2.

-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" expand-text="yes">
  
  <!-- How the result is written out. More about this in 1.5 -->
  <xsl:output method="xml" indent="yes"/>
  
  <xsl:template match="/">
    <result>
      <message>My first XSLT result!</message>
      <!-- TODO 2 goes here -->
      <first-session><xsl:value-of select="programme/session[1]/title"/></first-session>
      
    </result>
    <result>
      <message>
      <!-- Expected result 'Setup Info: SAXON HE 12.9 XSLT 3.0' -->
      <xsl:text>Setup Info: </xsl:text>
      <xsl:value-of select="system-property('xsl:product-name'),
        system-property('xsl:product-version'),
        'XSLT', system-property('xsl:version')"/></message>
    </result>
  </xsl:template>
  
</xsl:stylesheet>
