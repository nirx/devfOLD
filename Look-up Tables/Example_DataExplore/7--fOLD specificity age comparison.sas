
libname expt89 "\\coimabjerstore\jerlab_analysis\SAS\SAS Programs and Files\Expt89-xiaoxuef\SASFiles\";
libname exptinfo odbc user=ODBCUser password=O@dbcuser123456789 datasrc=mysql_exptinfo_64 direct_exe=delete;

ods html close; /* close previous */
dm 'odsresults;clear';
ods html;
ods graphics on;
ods listing gpath = 'c:\temp\';
ods graphics / imagefmt=tiff height=8.5in width=12in;
options orientation=landscape;
options topmargin=.001 bottommargin=.001 leftmargin=.001 rightmargin=.001;
ods rtf file='\\coimabjerstore\JERLab_Analysis\SAS\SAS Programs and Files\Expt89-xiaoxuef\Infant TenTen 2020\fOLDAnalysis\fOLDSpecificity_AgeCompare.rtf';

goptions i=j;

options notes;

data data1;set expt89.fOLDSpecificity;
Specificity_pct = Specificity * 100;
channelname = catx('-', Source, Detector);
run;

data lpba; set data1; where Atlas = 'LPBA40' ; run;

data lsog; set lpba; if ROI = 'L Superior occipital gyrus' and channelname in ('POz-PO3', 'POz-P1', 'P3-PO3', 'O1-PO3', 'O1-Oz'); 
run;

/*Channel-to-ROI specificity for selected ROIs*/
ods graphics / attrpriority=none;
proc sgplot data=lsog; *where ROI = 'L Superior occipital gyrus' and Specificity_pct ge 15;
title height=14pt bold 'LPBA40: Channel-to-ROI Specificity for the Left Superior Occipital Gyrus by Age Group';
vbar agename / response=Specificity_pct group=channelname groupdisplay=cluster fillattrs=(transparency=0.3);
yaxis values=(0 to 100 by 10) valueattrs=(size=12) label='Specificity (%) to the Left Superior Occipital Gyrus' 
labelattrs=(size=14pt weight=bold);
refline(15,50,75);
xaxis values=('3Month' '6Month' '20-24Years' 'fOLDadults')
valueattrs=(size=11);
run;
quit;

ods graphics / attrpriority=none;
proc sgplot data=lpba; where ROI = 'L Inferior frontal gyrus' and Specificity_pct ge 15;
title height=14pt bold 'LPBA40: Channel-to-ROI Specificity for the Left Inferior Frontal Gyrus by Age Group (Specificity >15%)';
vbar agename / response=Specificity_pct group=channelname groupdisplay=cluster fillattrs=(transparency=0.3);
yaxis values=(0 to 100 by 10) valueattrs=(size=12) label='Specificity (%) to the Left Inferior Frontal Gyrus' 
labelattrs=(size=14pt weight=bold);
refline(15,50,75);
xaxis values=('3Month' '6Month' '20-24Years' 'fOLDadults')
valueattrs=(size=11);
run;
quit;

/* Frequency count of the number of channels with specificity > cut-off*/

data lpba_plot; set lpba; if Specificity_pct ge 1 and ROI ne 'Brainstem';
length ROIname $40. ;
*side=scan(ROI, 1, ' ');
if ROI='Cerebellum' then do; ROIname='Cerebellum'; end;
else ROIname=substr(ROI, index(ROI, ' ')+1);
run;

proc freq data=lpba_plot; where Specificity_pct ge 15;
title height=14pt bold 'LPBA40: Number of Channels by ROI and Age Group (Specificity >15%)';
tables agename*ROIname / out=data2;
run;

data data2; set data2;
length AgeGroup $30.;
select(agename);
when('3Month') AgeGroup='A_3Months';
when('6Month') AgeGroup='B_6Months';
when('20-24Years') AgeGroup='C_20-24Years';
when('fOLDadults') AgeGroup='D_fOLDadult';
otherwise;
end;
run;

ods graphics / attrpriority=none;
proc sgplot data=data2; 
title height=14pt bold 'LPBA: The Number of Channels with Specificity >15% by ROI and Age';
vbar ROIname / response=count group=AgeGroup groupdisplay=cluster fillattrs=(transparency=0.3);
yaxis values=(0 to 40 by 5) valueattrs=(size=12) label='Number of Channels with Specificity >15%' 
labelattrs=(size=14pt weight=bold);
xaxis valueattrs=(size=11);
run;
quit;


proc freq data=lpba_plot; where Specificity_pct ge 1;
title height=14pt bold 'LPBA40: Number of Channels by ROI and Age Group (Specificity >1%)';
tables agename*ROIname / out=data3;
run;

data data3; set data3;
length AgeGroup $30.;
select(agename);
when('3Month') AgeGroup='A_3Months';
when('6Month') AgeGroup='B_6Months';
when('20-24Years') AgeGroup='C_20-24Years';
when('fOLDadults') AgeGroup='D_fOLDadult';
otherwise;
end;
run;

ods graphics / attrpriority=none;
proc sgplot data=data3; 
title height=14pt bold 'LPBA: The Number of Channels with Specificity >1% by ROI and Age';
vbar ROIname / response=count group=AgeGroup groupdisplay=cluster fillattrs=(transparency=0.3);
yaxis values=(0 to 60 by 5) valueattrs=(size=12) label='Number of Channels with Specificity >1%' 
labelattrs=(size=14pt weight=bold);
xaxis valueattrs=(size=11);
run;
quit;

ods rtf close;
