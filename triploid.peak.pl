#!/bin/env perl
#
use strict;
use warnings;

my@keys=qw/
#Chr
Zygosity
A.Ratio
/;
my@index;

my$header=0;
while(<>){
	/^##/ and next;
	chomp;
	if(!$header){
		$header=1;
		my@title=split /\t/,$_;
		my%title;
		@title{@title}=0 .. $#title;
		@index=@title{@keys};
		print join("\t",@keys),"\n";
		print STDERR join("\t",@index),"\n";
		next;
	}
	my@ln=split /\t/,$_;
	print join("\t",@ln[@index]),"\n";
}
__END__
#Chr	Start	Stop	MapLoc	SampleID	NbGID	Ref	VarType	Call	Flank	Zygosity	Depth	A.Depth	A.Ratio	RepeatTag	Filter	MIM Gene ID	MIM Pheno IDs	MIM Inheritance	TestCode	Gene Symbol	FuncRegion	ExIn_ID	pfamName	pfamId	Function	Transcript	Protein	cHGVS	pHGVS	pHGVS1	pHGVS3	CodonChange	PolarChange	MutationName	ClinVar Significance	dbSNP Allele Freq	1000G EAS AF	1000G AF	1000G EAS AF.1	ESP6500 AF	ExAC EAS HomoAlt Count	ExAC EAS AF	ExAC HomoAlt Count	ExAC AF	GnomAD EAS HomoAlt Count	GnomAD EAS AF	GnomAD HomoAlt Count	GnomAD AF	rsID	PVFD Homo Count	PVFD AF	Panel AlleleFreq	PhyloP Vertebrates	PhyloP Placental Mammals	Ens Condel Pred	HGMD ID	HGMD pmID	HGMD Pred	Interpro_domain	SIFT Pred	Polyphen2 HDIV Pred	Polyphen2 HVAR Pred	MutationTaster Pred	GERP++_RS	dbscSNV_ADA_SCORE	dbscSNV_RF_SCORE	GWASdb_or	AutoInterpStatus	SecondaryFinding_Var_证据项	SecondaryFinding_Var_致病等级	SecondaryFinding_Var_参考文献	SecondaryFinding_Var_Phenotype_OMIM_ID	SecondaryFinding_Var_DiseaseNameEN	SecondaryFinding_Var_DiseaseNameCH	SecondaryFinding_Var_updatetime	SpliceAI	SpliceAI Pred	SpliceAI Interpretation	AutoPVS1 Hgvs_c	AutoPVS1 Strength	AutoPVS1 Adjusted Strength	AutoPVS1 Criterion
1	17718671	17718672	1p36.13	20B8121728	.	G	del	.	AGCCA.GGTGG	hom-alt	.	149	1.00	.	PASS	.	.	.	.	PADI6	C9	EX9	Protein-arginine deiminase (PAD)	PF03068.13	frameshift	NM_207421.3	NP_997304.3	c.1026G[2>1] (std: c.1026G[1] alt: c.1027delG )	p.V343Wfs*33 | p.Val343Trpfs*33	p.V343Wfs*33	p.Val343Trpfs*33	.	.	NM_207421.3(PADI6): c.1026G[1] (p.Val343Trpfs*33)	.	1.000000	1.000000	1.000000	1.000000	0.999577	976	1.000000	17824	1.000000	5671	1.000000	81914	1.00000e+00	rs10709483	.	.	.	1.092	1.116	.	.	.	.	.	.	.	.	.	.	.	.	.	.								SpliceAI=A|PADI6|0.00|0.00|0.02|0.00|3|-46|50|40	P	.	NM_207421.4:c.1027+1del	VeryStrong	VeryStrong	NF1
1	104076466	104076466	1p21.1	20B8121728	.	.	ins	A	CTCTG.AAAAA	het-ref	.	16	0.18	.	PASS	.	.	.	.	RNPC3	C3	EX3	RNA recognition motif. (a.k.a. RRM, RBD, or RNP domain)	PF00076.20	frameshift	NM_017619.3	NP_060089.1	c.347A[12>13] (std: c.358dupA alt: c.358_359insA )	p.R120Kfs*3 | p.Arg120Lysfs*3	p.R120Kfs*3	p.Arg120Lysfs*3	.	.	NM_017619.3(RNPC3): c.358dupA (p.Arg120Lysfs*3)	.	0.998309	.	.	.	.	0	0.049618	0	0.116338	0	0.124424	11	1.21514e-01	rs748882456	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.								SpliceAI=GA|RNPC3|0.00|0.00|0.00|0.00|-35|-5|13|-5	P	.	NM_017619.4:c.358dup	VeryStrong	Strong	NF1
1	152275297	152275298	1q21.3	20B8121728	.	T	snv	A	ATCTT.ACCAA	het-ref	.	112	0.46	.	PASS	.	.	.	.	FLG	C2E	EX3E	.	.	nonsense	NM_002016.1	NP_002007.1	c.12064A>T	p.K4022* | p.Lys4022*	p.K4022*	p.Lys4022*	AAA=>TAA	P+=>.	NM_002016.1(FLG): c.12064A>T (p.Lys4022*)	Conflicting_interpretations_of_pathogenicity	0.001480	0.019800	0.003994	0.019800	.	2	0.019302	2	0.001376	1	0.018961	1	1.33703e-03	rs146466242	.	.	.	-0.877	-0.899	.	CM098119	29380403|28842327|28120571|25997159|22407025|19663875	DM	.	.	.	.	D	-3.82	.	.	.	.								SpliceAI=A|FLG|0.00|0.00|0.00|0.00|-4|36|12|3	P	.	NM_002016.2:c.12064A>T	Unmet	Unmet	NF4
1	179858443	179858444	1q25.2	20B8121728	.	G	snv	A	TATTA.CAGTG	het-ref	.	79	0.48	.	PASS	.	.	.	.	TOR1AIP1	AC2	IVS2	.	.	splice-3	NM_001267578.1	NP_001254507.1	c.554-1G>A	.	.	.	.	.	NM_001267578.1(TOR1AIP1): c.554-1G>A	Conflicting_interpretations_of_pathogenicity	0.646149	0.777800	0.635383	0.777800	0.583064	2485	0.760347	25726	0.646593	4961	0.759611	52839	6.50857e-01	rs2245425	.	.	.	3.172	2.598	.	.	.	.	.	.	.	.	P	5.26	0.99996748057446	0.918	.	.								SpliceAI=A|TOR1AIP1|0.15|0.97|0.00|0.00|4|1|2|-50	D	1:179858448 (=179858444+4) acceptor gain 0.15;1:179858445 (=179858444+1) acceptor loss 0.97	NM_001267578.1:c.554-1G>A	Unmet	Unmet	SS7
1	179883189	179883190	1q25.2	20B8121728	.	G	snv	A	CCGAC.TAAGT	het-ref	.	41	0.46	.	PASS	.	.	.	.	TOR1AIP1	DC9	IVS9	.	.	splice-5	NM_001267578.1	NP_001254507.1	c.967+1G>A	.	.	.	.	.	NM_001267578.1(TOR1AIP1): c.967+1G>A	Benign	0.005684	0.053600	0.010982	0.053600	0.000231	18	0.068414	18	0.005458	38	0.068293	39	5.44051e-03	rs2274955	.	.	.	3.153	2.526	.	.	.	.	.	.	.	.	D	5.39	0.99994568797423	0.938	.	.								SpliceAI=A|TOR1AIP1|0.00|0.00|0.00|0.93|7|-50|9|-1	D	1:179883189 (=179883190-1) donor loss 0.93	NM_001267578.1:c.967+1G>A	Moderate	Supporting	SS9
2	31805880	31805880	2p23.1	20B8121728	.	.	ins	G	CCGGA.GGCTT	hom-alt	.	187	1.00	.	PASS	.	.	.	.	SRD5A2	C1	EX1	3-oxo-5-alpha-steroid 4-dehydrogenase 	PF02544.14	frameshift	NM_000348.3	NP_000339.2	c.88C[3>4] (std: c.90dupC alt: c.90_91insC )	p.S31Lfs*105 | p.Ser31Leufs*105	p.S31Lfs*105	p.Ser31Leufs*105	.	.	NM_000348.3(SRD5A2): c.90dupC (p.Ser31Leufs*105)	.	0.999975	1.000000	1.000000	1.000000	0.999662	4224	1.000000	58283	0.999974	8553	1.000000	119898	9.99979e-01	rs142200057	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.								SpliceAI=AG|SRD5A2|0.00|0.00|0.00|0.00|48|2|19|16	P	.	NM_000348.4:c.88-1dup	VeryStrong	VeryStrong	NF1
2	71163085	71163086	2p13.3	20B8121728	.	T	snv	C	CTCCA.GGCCA	het-ref	.	30	0.43	.	PASS	.	.	.	.	ATP6V1B1	C1	EX1	.	.	init-loss	NM_001692.3	NP_001683.2	c.2T>C	p.0?	p.0?	p.0?	.	.	NM_001692.3(ATP6V1B1): c.2T>C (p.0?)	Benign	0.407856	0.359100	0.368810	0.359100	0.415039	674	0.389942	10437	0.409492	1331	0.394319	20525	4.00777e-01	rs11681642	.	.	.	2.819	1.834	deleterious	.	.	.	.	D	D	I	P	4.9	.	.	.	.								SpliceAI=C|ATP6V1B1|0.00|0.00|0.00|0.00|-39|43|21|-37	P	.	NM_001692.4:c.2T>C	Supporting	Supporting	IC4
2	179306432	179306432	2q31.2	20B8121728	.	.	ins	AGTTTCCATAAATGACTCTAGCCTGCAAATTGTAGTATATTCTCTCT	TTTCC.TGAAC	het-ref	.	97	0.36	.	PASS	.	.	.	.	PRKRA	AC5	IVS5	.	.	splice-3	NM_003690.4	NP_003681.1	c.515-2_515-1insAGAGAGAATATACTACAATTTGCAGGCTAGAGTCATTTATGGAAACT	.	.	.	.	.	NM_003690.4(PRKRA): c.515-2_515-1insAGAGAGAATATACTACAATTTGCAGGCTAGAGTCATTTATGGAAACT	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.								.	.	.	NM_003690.5:c.515-2_515-1insAGAGAGAATATACTACAATTTGCAGGCTAGAGTCATTTATGGAAACT	VeryStrong	VeryStrong	SS1
2	186603605	186603605	2q32.1	20B8121728	.	.	ins	G	GCTGA.GGGGG	het-ref	.	27	0.50	.	PASS	.	.	.	.	FSIP2	C1	EX1	.	.	frameshift	NM_173651.2	NP_775922.2	c.252G[5>6] (std: c.256dupG alt: c.256_257insG )	p.A86Gfs*78 | p.Ala86Glyfs*78	p.A86Gfs*78	p.Ala86Glyfs*78	.	.	NM_173651.2(FSIP2): c.256dupG (p.Ala86Glyfs*78)	.	0.323953	0.412700	0.338458	0.412700	.	11	0.375000	569	0.317231	778	0.389949	7135	3.33323e-01	rs35617283	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.	.								SpliceAI=AG|FSIP2|0.00|0.00|0.00|0.00|47|2|-16|-33	P	.	.	.	.	.
