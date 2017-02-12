<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/">
      <xsl:document href="index.html" encoding="iso-8859-1">
        <html><body>
          <xsl:call-template name="menu1"/>
          <h1>Liste d'ue</h1>
          <ul>
            <xsl:for-each select="//ue">
              <li><a>
                <xsl:attribute name="href">ue/<xsl:value-of select="@id"/>.html</xsl:attribute>
                <xsl:value-of select="nom"/>
              </a></li>
            </xsl:for-each>
          </ul>
          <h1>Liste d'intervenant</h1>
          <ul>
            <xsl:for-each select="//intervenant">
              <li><a>
                <xsl:attribute name="href">inter/<xsl:value-of select="@id"/>.html</xsl:attribute>
                <xsl:value-of select="nom"/>
              </a></li>
            </xsl:for-each>
          </ul>
          <h1>Liste Parcours</h1>
          <ul>
            <xsl:for-each select="//parcours">
              <li><a>
                <xsl:attribute name="href">parcours/<xsl:value-of select="nom"/>.html</xsl:attribute>
                <xsl:value-of select="nom"/>
              </a></li>
            </xsl:for-each>
          </ul>
        </body></html>
      </xsl:document>

      <xsl:call-template name="liste-des-unites" />

      <xsl:call-template name="fiche-intervenant" />

      <xsl:call-template name="fiche-parcours" />

  </xsl:template>

  <xsl:template name="liste-des-unites">
    <xsl:for-each select="//ue">
        <xsl:document href="ue/{@id}.html" encoding="iso-8859-1">
          <html><body>
            <xsl:call-template name="menu"/>
          <h2>
            <xsl:attribute name="id">
              <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:value-of select="nom"/>
          </h2>
          <p>crédit : <xsl:value-of select="credit" /></p>
          <p>description : <xsl:copy-of select="description/*" /></p>
          <p>
            intervenant :
            <xsl:for-each select="ref-intervenant">
              <a>
                <xsl:attribute name="href">../inter/<xsl:value-of select="@ref"/>.html</xsl:attribute>
                <xsl:value-of select="@ref"/>
              </a>
            </xsl:for-each>
          </p>
        </body></html>
      </xsl:document>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="fiche-intervenant">
    <xsl:for-each select="//intervenant">
      <xsl:document href="inter/{@id}.html" encoding="iso-8859-1">
        <html><body>
          <xsl:call-template name="menu"/>
          <h2>
            <xsl:attribute name="id">
              <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:value-of select="nom"/>
          </h2>
          <p>mail : <xsl:value-of select="mail" /></p>
          <p>site : <xsl:value-of select="site" /></p>
        </body></html>
      </xsl:document>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="fiche-parcours">
    <xsl:for-each select="//parcours">
      <xsl:document href="parcours/{nom}.html" encoding="iso-8859-1">
        <html><body>
          <xsl:call-template name="menu"/>
          <h2>
            <xsl:attribute name="id">
              <xsl:value-of select="nom"/>
            </xsl:attribute>
            <xsl:value-of select="nom"/>
          </h2>
          <p>description : <xsl:copy-of select="description" /></p>
          <ul>
            <xsl:for-each select="semestre/ref-ue">
              <li>
                <a>
                  <xsl:attribute name="href">../ue/<xsl:value-of select="@ref"/>.html</xsl:attribute>
                  <xsl:value-of select="@ref"/>
                </a>
              </li>
            </xsl:for-each>
          </ul>
        </body></html>
      </xsl:document>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="menu1">
    <nav>
      <a href="index.html">INDEX</a>
    </nav>
  </xsl:template>

  <xsl:template name="menu">
    <nav>
      <a href="../index.html">INDEX</a>
    </nav>
  </xsl:template>

</xsl:stylesheet>
