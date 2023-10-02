<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:x="http://www.portalfiscal.inf.br/mdfe"
                              xmlns:fn="http://www.w3.org/2005/xpath-functions"
                              xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="no"/>

    <xsl:template match="/">

        <xsl:variable name="chaveCTe">
            <xsl:call-template name="chave-cte">
                <xsl:with-param name="chave-cte" select=".//x:MDFe/x:infMDFe/@Id" />
            </xsl:call-template>
        </xsl:variable>

        <html ng-app="DAMDFEApp" ng-controller="PrintController as page">
            <head>
                <meta charset="utf-8"/>
                <title>Impressão de MDFe</title>

                <link href="https://fonts.googleapis.com/css?family=Libre+Barcode+128" rel="stylesheet"></link>

                <style>
                    body * {
                        font-family: Arial, Helvetica, Sans-Serif;
                        font-size: 8px;
                    }

                    *, *:before, *:after {
                      -webkit-box-sizing: border-box;
                      -moz-box-sizing: border-box;
                      box-sizing: border-box;
                    }

                    div {
                        margin: 0.4px;
                    }

                    .img {
                        background-image: src="resources/mdf-e.jpg"
                        background-size: contain;
                        background-position: 0 center;
                        background-repeat: no-repeat;
                        height: 85px;
                        width: 100px;
                    }

                    #page {
                        display: flex;
                        flex-direction: column;
                        height: 240mm;
                        width: 190mm;
                    }

                    .row {
                        display: flex;
                        flex-direction: row;
                        width: 100%;
                    }

                    .column {
                        display: flex;
                        flex-direction: column;
                        flex: 1;
                    }

                    .border {
                        border: 1px solid black;
                    }

                    .header {
                        height: 25%;
                    }

                    .center {
                        justify-content: center;
                        align-items: center;
                    }

                    .fill {
                        height: 100%;
                    }

                    .title {
                        font-size: 14px;
                    }

                    .capitalized {
                        font-size: 24px;
                    }

                    #barCode {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        height: 100%;
                    }

                    .m-left {
                        margin-left: 3px;
                    }

                    .m-top {
                        margin-top: 3px;
                    }

                </style>
            </head>
            <body>
                <div id="page">
                <xsl:variable name="firstColumnSize">
                    <xsl:choose>
                            <xsl:when test="//x:MDFe/x:infMDFeSupl/x:qrCodMDFe">45</xsl:when>
                            <xsl:when test="not(//x:MDFe/x:infMDFeSupl/x:qrCodMDFe)">100</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                    <div class="row header">
                        <div class="column">
                            <div class="row" style="height: 80%">
                            <div class="border" style=" width: {$firstColumnSize}%">

                                <div class="m-left" style="text-align: center">
                                    <img width="120px" style="margin-top: 10px;margin-bottom: 10px;" src="resources/mdf-e.jpg" class="logotipo"/>
                                </div>

                                <table style="width: 100%;">
                                    <tr>
                                        <td colspan="2">
                                            <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:xFant"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div style="display: inline;">
                                                <div style="display: inline;">
                                                    <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:enderEmit/x:xLgr" />
                                                </div>
                                                <div style="display: inline;">
                                                    , <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:enderEmit/x:nro" />
                                                </div>
                                                <div style="display: inline;">
                                                    , <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:enderEmit/x:xCpl" />
                                                </div>
                                                <div style="display: inline;">
                                                    <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:enderEmit/x:CEP" />
                                                </div>
                                                <div style="display: inline;">
                                                    , <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:enderEmit/x:xBairro" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div>
                                                <div style="display: inline;">
                                                    <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:enderEmit/x:xMun" />
                                                </div>
                                                <div style="display: inline;">
                                                    /
                                                </div>
                                                <div style="display: inline;">
                                                    <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:enderEmit/x:UF" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <div style="display: inline;">
                                                    CNPJ:
                                                </div>
                                                <div style="display: inline;">
                                                    <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:CNPJ" />
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <div style="display: inline;">
                                                    RNTRC:
                                                </div>
                                                <div style="display: inline;">
                                                    <xsl:value-of select="//x:MDFe/x:infMDFe/x:infModal/x:rodo/x:infANTT/x:RNTRC" />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="display: inline;">
                                                IE:
                                            </div>
                                            <div style="display: inline;">
                                                <xsl:value-of select="//x:MDFe/x:infMDFe/x:emit/x:IE" />
                                            </div>
                                        </td>
                                        <td>
                                            <div style="display: inline;">
                                                Telefone:
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display: inline;">
                                                E-mail:
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <xsl:if test="//x:MDFe/x:infMDFeSupl/x:qrCodMDFe">
                                <div class="border" style="width: 55%;" > 
                                    <input style="display: none" id="linkQrCode" value="{//x:MDFe/x:infMDFeSupl/x:qrCodMDFe}"></input>
                                    <div id="qrCodeBox" style="padding-left: 25px; padding-top:15px">
                                    </div>
                                </div>
                            </xsl:if>
                            </div>
                            <div class="row" style="height: 20%;">
                                <div class="border" style="width: 10%">
                                    <div style="display: block;">
                                        <div class="row center">
                                            Modelo
                                        </div>
                                        <div class="row center">
                                            <xsl:value-of select="//x:MDFe/x:infMDFe/x:ide/x:mod" />
                                        </div>
                                    </div>
                                </div>
                                <div class="border" style="width: 10%">
                                    <div style="display: block;">
                                        <div class="row center">
                                            Série
                                        </div>
                                        <div class="row center">
                                            <xsl:value-of select="//x:MDFe/x:infMDFe/x:ide/x:serie" />
                                        </div>
                                    </div>
                                </div>
                                <div class="border" style="width: 15%">
                                    <div style="display: block;">
                                        <div class="row center">
                                            Número
                                        </div>
                                        <div class="row center">
                                            <xsl:value-of select="//x:MDFe/x:infMDFe/x:ide/x:nMDF" />
                                        </div>
                                    </div>
                                </div>
                                <div class="border" style="width: 10%">
                                    <div style="display: block;">
                                        <div class="row center">
                                            Folha
                                        </div>
                                        <div class="row center">
                                            1/1
                                        </div>
                                    </div>
                                </div>
                                <div class="border" style="width: 40%">
                                    <div style="display: block;">
                                        <div class="row center">
                                            Data e Hora de Emissão
                                        </div>
                                        <div class="row center">
                                            <xsl:variable name="dhEmi">
                                                <xsl:call-template name="formatDate">
            										<xsl:with-param name="date" select="//x:MDFe/x:infMDFe/x:ide/x:dhIniViagem" />
            									</xsl:call-template>
                                            </xsl:variable>
                                            <xsl:value-of select="concat(substring($dhEmi, 1, 16), 'h')"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="border" style="width: 15%">
                                    <div style="display: block;">
                                        <div class="row center">
                                            <span>UF Carreg.</span>
                                        </div>
                                        <div class="row center">
                                            <xsl:value-of select="//x:MDFe/x:infMDFe/x:ide/x:UFIni" />
                                        </div>
                                    </div>
                                </div>
                                <div class="border" style="width: 15%">
                                    <div style="display: block;">
                                        <div class="row center">
                                            <span>UF Descarr.</span>
                                        </div>
                                        <div class="row center">
                                            <xsl:value-of select="//x:MDFe/x:infMDFe/x:ide/x:UFFim" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="column">
                            <div class="border" style="height: 25%">
                                <div class="row center title" style="height: 50%;">
                                    DAMDF-e
                                </div>
                                <div class="row center">
                                    Documento Auxiliar de Manifesto Eletrônico de Documentos Fiscais
                                </div>
                            </div>
                            <div class="border" style="height: 35%">
                                <div id="barCode">
                                    <!-- <span style="font-family: 'Libre Barcode 128', cursive; font-size:20px"><xsl:value-of select="$chaveCTe" /></span> -->
                                </div>
                            </div>
                            <div class="border" style="height: 20%">
                                <div class="row">
                                    <span class="m-left">Chave de acesso</span>
                                </div>
                                <div class="row center" style="margin-top: 8px;">
                                    <xsl:value-of select="$chaveCTe" />
                                </div>
                            </div>
                            <div class="border" style="height: 20%;">
                                <div class="row">
                                    <span class="m-left">Protocolo de Autorização de Uso</span>
                                </div>
                                <div class="row center" style="margin-top: 8px;">
                                    <xsl:value-of select="//x:mdfeProc/x:protMDFe/x:infProt/x:nProt" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="border row center" style="height: 2%;">
                        <span>Modal Rodoviário de Carga</span>
                    </div>

                    <div class="row" style="height: 8%;">
                        <div class="border column">
                            <div class="row">
                                <span class="m-left m-top">CIOT</span>
                            </div>
                        </div>
                        <div class="border column">
                            <div class="row">
                                <span class="m-left m-top">Qtd. CTe</span>
                            </div>
                            <div class="row center capitalized fill">
                                <xsl:value-of select="//x:MDFe/x:infMDFe/x:tot/x:qCTe" />
                            </div>
                        </div>
                        <div class="border column">
                            <div class="row">
                                <span class="m-left m-top">Qtd. NFe</span>
                            </div>
                            <div class="row center capitalized fill">
                                <!-- <xsl:value-of select="//x:MDFe/x:infMDFe/x:tot/x:qCTe" /> -->
                            </div>
                        </div>
                        <div class="border column">
                            <div class="row">
                                <span class="m-left m-top">Peso Total</span>
                            </div>
                            <div class="row center capitalized fill">
                                <xsl:variable name="pesoNotaFiscal">
            						<xsl:choose>
            							<xsl:when test="//x:MDFe/x:infMDFe/x:tot/x:qCarga">
            								<xsl:value-of select="//x:MDFe/x:infMDFe/x:tot/x:qCarga" />
            							</xsl:when>
            							<xsl:otherwise>
            								<xsl:value-of select="0"/>
            							</xsl:otherwise>
            						</xsl:choose>
            					</xsl:variable>
                                <xsl:value-of select="round($pesoNotaFiscal)"/>&#160;kg
                            </div>
                        </div>
                        <div class="border column"></div>
                    </div>

                    <div class="row" style="height: 2%;">
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left">Veículo</span>
                        </div>
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left">Condutor</span>
                        </div>
                    </div>

                    <div class="row" style="height: 2%;">
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left">Placa</span>
                        </div>
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left">RNTRC</span>
                        </div>
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left">CPF</span>
                        </div>
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left">Nome</span>
                        </div>
                    </div>

                    <div class="row" style="height: 2%;">
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left"><xsl:value-of select="//x:MDFe/x:infMDFe/x:infModal/x:rodo/x:veicTracao/x:placa" /></span>
                        </div>
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left"><xsl:value-of select="//x:MDFe/x:infMDFe/x:infModal/x:rodo/x:infANTT/x:RNTRC" /></span>
                        </div>
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left"><xsl:value-of select="//x:MDFe/x:infMDFe/x:infModal/x:rodo/x:veicTracao/x:condutor/x:CPF" /></span>
                        </div>
                        <div class="border column" style="justify-content: center;">
                            <span class="m-left"><xsl:value-of select="//x:MDFe/x:infMDFe/x:infModal/x:rodo/x:veicTracao/x:condutor/x:xNome" /></span>
                        </div>
                    </div>

                    <xsl:for-each select="//x:MDFe/x:infMDFe/x:infModal/x:rodo/x:veicReboque/x:placa">
                        <div class="row" style="height: 2%;">
                            <div class="border column" style="justify-content: center;">
                                <span class="m-left">
                                    <xsl:value-of select="." />
                                </span>
                            </div>
                            <div class="border column" style="justify-content: center;">
                                <span class="m-left">
                                    <xsl:value-of select="//x:MDFe/x:infMDFe/x:infModal/x:rodo/x:infANTT/x:RNTRC" />
                                </span>
                            </div>
                            <div class="border column" style="justify-content: center;">
                                <span class="m-left"></span>
                            </div>
                            <div class="border column" style="justify-content: center;">
                                <span class="m-left"></span>
                            </div>
                        </div>
                    </xsl:for-each>

                    <div class="row" style="height: 40%;">

                        <div class="column">
                            <div class="border" style="height: 60%"></div>

                            <div class="row" style="height: 25px;">
                                <div class="border column" style="justify-content: center;">
                                    <span class="m-left">Vale Pedágio</span>
                                </div>
                            </div>

                            <div style="display: flex; flex-direction: row; width: 100%; height: 25px;">
                                <div class="border column" style="justify-content: center;">
                                    <span class="m-left">CNPJ Responsável</span>
                                </div>
                                <div class="border column" style="justify-content: center;">
                                    <span class="m-left">CNPJ Fornecedor</span>
                                </div>
                                <div class="border column" style="justify-content: center;">
                                    <span class="m-left">Nº Comprovante</span>
                                </div>
                            </div>

                            <div class="row" style="height: 36%;">
                                <div class="border column"></div>
                                <div class="border column"></div>
                                <div class="border column"></div>
                            </div>

                        </div>

                        <div class="row" style="flex: 1;">
                            <div class="border column"></div>
                            <div class="border column"></div>
                        </div>
                    </div>

                    <div class="row" style="height: 2%;">
                        <div style="flex: 1;">
                            <span class="m-left">Observações</span>
                        </div>
                        <div style="flex: 1;">
                            <span class="m-left">Reservado ao Fisco</span>
                        </div>
                    </div>

                    <div class="row" style="height: 20%;">
                        <div class="border column"></div>
                        <div class="border column"></div>
                    </div>
                </div>

                <script src="/planck/resource?public.base.angular.angular-min"></script>
                <script src="/planck/resource?public.base.services.qrcode.min"></script>

                <script type="text/javascript">
                    var app = angular.module('DAMDFEApp', []);
                    window.onload = function() {
						var qrText = document.getElementById("linkQrCode");
						if (qrText) 
							var qrcode = new QRCode(document.getElementById("qrCodeBox"), {
								text : qrText.value,
								width : 140,
								height : 140
							});
					};
                </script>

                <script src="/planck/resource?public.base.services.barcode-js"></script>

                <script type="text/javascript">
                    app.controller('PrintController', ['barcode'
                        , function(barcode) {

                            let container = document.createElement('p');
                            barcode.codeCode128C('<xsl:value-of select="$chaveCTe" />', container, 1);
                            document.getElementById("barCode").appendChild(container);
                        }
                    ]);
                </script>

            </body>
        </html>


    </xsl:template>

    <xsl:template name="formatDate">
		<xsl:param name="date"/>

		<xsl:variable name="year" select="substring($date, 1, 4)"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		<xsl:variable name="day" select="substring($date, 9, 2)"/>

		<xsl:variable name="hour" select="substring($date, 12, 2)"/>
		<xsl:variable name="minute" select="substring($date, 15, 2)"/>
		<xsl:variable name="second" select="substring($date, 18, 2)"/>

		<xsl:value-of select="concat($day, '/', $month, '/', $year)" />
		<xsl:if test="$hour">
			<xsl:value-of select="concat('&#160;', $hour, ':', $minute, ':', $second)" />
		</xsl:if>
	</xsl:template>

    <xsl:template name="chave-cte">
		<xsl:param name="chave-cte" />
		<xsl:value-of select="substring($chave-cte, 5)"/>
	</xsl:template>

    <xsl:template name="barcode">
		<xsl:param name="digits"/>
		<xsl:param name="start"/>

		<xsl:variable name="color">
			<xsl:choose>
				<xsl:when test="$start mod 2 = 1">
					<xsl:value-of select="'b'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'w'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<i>
			<xsl:attribute name="class">
				<xsl:value-of select="concat('b', $color, substring($digits, $start, 1))"/>
			</xsl:attribute>
		</i>

		<xsl:if test="$start &lt; string-length($digits)">
			<xsl:call-template name="barcode">
				<xsl:with-param name="digits" select="$digits"/>
				<xsl:with-param name="start" select="$start + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>