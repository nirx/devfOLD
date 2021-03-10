# The Developmental fNIRS Optodes’ Location Decider: devfOLD

The toolbox assists NIRS and fNIRS users to design source-detector channel arrangement based on study-specific age groups and regions of interests (ROIs). 

Users of the devfOLD should refer to the manuscript: 
Fu, X., & Richards, J.E: Age-specific Design of fNIRS Channel Placement: devfOLD: The Developmental fNIRS Optodes’ Location Decider. 

devfOLD is available as an Application for Matlab environment: /App/fOLD.mlappinstall
It operates on all tested MATLAB platforms (Windows 2020b, Mac OSX 2020b, Linux 2020a, Windows and Mac OSX MATLAB online).
We presume that it works on prior MATLAB versions and will work on future ones.

The current toolbox is an extension of the fOLD toolbox (Zimeo Morais, Balardin, Sato, 2018). Please refer to:
* Toolbox: https://github.com/nirx/fOLD-public
* Manuscript: https://www.nature.com/articles/s41598-018-21716-z

The key improvements from the fOLD toolbox are:
* The channel-to-ROI specificity were estimated using age-specific head models. The head models were obtained from the “Neurodevelopmental MRI Database”. Information about the Database is available online: http://jerlab.psych.sc.edu/NeurodevelopmentalMRIDatabase/
* The devfOLD allows users to make channel design decisions based on 1) averaged age group estimations from individual head models from the Database; 2) estimations from an individual participant head model from the user’s study; or 3) estimations from average age-appropriate templates from the Database.
* ROI parcellations were conducted using developmentally appropriate stereotaxic atlases:
  Lobar: Fillmore, Richards, Phillips-Meek, Cryer, and Stevens (2015)
  Hammers: Heckemann, Hajnal, Aljabar, Rueckert, and Hammers (2006)
  Brainnetome: Fan et al. (2016)
  Desikan-Killiany-Tourville (Freesurfer): Klein and Tourville (2012)
    - Infant Freesurfer: Zöllei, Iglesias, Ou, Grant, and Fischl (2020)
  LONI Probabilistic Brain Atlas (LPBA40): Shattuck et al. (2008)
  AAL3: Rolls, Huang, Lin, Feng, and Joliot (2020)

The toolbox provides a set of example data: 
* 3 months, 6 months, and adults - averaged age group estimations from individual head models (#1). Estimations can be displayed using the “Age” dropdown list.
* A 3-month old individual: S0131 (#2). Estimations can be displayed by typing in the folder name in the “Age(specify)” box.
* A 3-month age-appropriate template: S0300 (#3). Estimations can be displayed by typing in the folder name in the “Age(specify)” box.

Additional data can be downloaded from folder “SeparateGroups” (method #1) based on the age group of interest. Please save the individual age folder (e.g. “1-0Months”) in the ../Developer/mat/ directory, and use the “Age(specify)” box in the toolbox to display the estimations.

**Important Copyright-related guidelines for devfOLD**: 
1) devfOLD is provided "as is" with no warranties and subject to change.
2) The software shall not be redistributed without authorization.
3) The aforementioned paper (Fu and Richards) should be referenced if using devfOLD.

**References for the atlases used**:

Fan, L., Li, H., Zhuo, J., Zhang, Y., Wang, J., Chen, L., . . . Jiang, T. (2016). The Human Brainnetome Atlas: A New Brain Atlas Based on Connectional Architecture. Cerebral Cortex, 26(8), 3508-3526. doi:10.1093/cercor/bhw157
Fillmore, P. T., Richards, J. E., Phillips-Meek, M. C., Cryer, A., & Stevens, M. (2015). Stereotaxic Magnetic Resonance Imaging Brain Atlases for Infants from 3 to 12 Months. Developmental Neuroscience, 37(6), 515-532. doi:10.1159/000438749
Heckemann, R. A., Hajnal, J. V., Aljabar, P., Rueckert, D., & Hammers, A. (2006). Automatic anatomical brain MRI segmentation combining label propagation and decision fusion. Neuroimage, 33(1), 115-126. doi:https://doi.org/10.1016/j.neuroimage.2006.05.061
Klein, A., & Tourville, J. (2012). 101 Labeled Brain Images and a Consistent Human Cortical Labeling Protocol. Frontiers in Neuroscience, 6(171). doi:10.3389/fnins.2012.00171
Rolls, E. T., Huang, C.-C., Lin, C.-P., Feng, J., & Joliot, M. (2020). Automated anatomical labelling atlas 3. Neuroimage, 206, 116189. 
Shattuck, D. W., Mirza, M., Adisetiyo, V., Hojatkashani, C., Salamon, G., Narr, K. L., . . . Toga, A. W. (2008). Construction of a 3D probabilistic atlas of human cortical structures. Neuroimage, 39(3), 1064-1080. doi:https://doi.org/10.1016/j.neuroimage.2007.09.031
Zöllei, L., Iglesias, J. E., Ou, Y., Grant, P. E., & Fischl, B. (2020). Infant FreeSurfer: An automated segmentation and surface extraction pipeline for T1-weighted neuroimaging data of infants 0–2 years. Neuroimage, 218, 116946. doi:https://doi.org/10.1016/j.neuroimage.2020.116946

------------------------------------------------------------------------------------------
