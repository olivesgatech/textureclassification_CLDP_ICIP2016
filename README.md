# textureclassification_CLDP_ICIP2016

Codes for the paper submitted to ICIP2016 titled "completed local derivative pattern for rotation invariant texture classification"
By Yuting (huyuting@gatech.edu)
Label: cldp_version1.0
Date: 02/02/2016.
-------------------------------
Publication:
Y. Hu, Z. Long, G. AlRegib, “Completed Local Derivative Pattern for Rotation Invariant Texture Classification,” IEEE International Conference on Image Processing (ICIP 2016), pp. 3548-3552, 2016.
---------------------------------
Bib:
@inproceedings{hu2016completed,
  title={Completed local derivative pattern for rotation invariant texture classification},
  author={Hu, Yuting and Long, Zhiling and AlRegib, Ghassan},
  booktitle={Image Processing (ICIP), 2016 IEEE International Conference on},
  pages={3548--3552},
  year={2016},
  organization={IEEE}
}
-----------------------------------------------------------------------------------------------------------------------------------------

1. Resources

   The codes are based on the following links:
   1) CLBP: the source codes of the proposed algorithm can be downloaded from http://www.comp.polyu.edu.hk/~cslzhang/code/CLBP.rar.
      The implemnetation of binary pattern extraction (CLDP) part is based on the revision of CLBP codes.
   2) DRLBP(Dominant Rotated Local binary pattern) MatlabCode: http://www.cs.tut.fi/~mehta/drlbp.
      The implementation of the CLDP-based texture classification on the Outex database is based on the classification part in DRLBP codes.
-----------------------------------------------------------------------------------------------------------------------------------------
2. Objective, database and main functions

   1) Objective: texture classification based on the histogram fusion of completed local derivative patterns (CLDP)
   2) Database: three test suits => Outex TC10("inca"), TC12("t184" and "horizon")
   3) Main functions
      a. cldp_d(img,r,p,mapping,'h'):
	 inputs: original image img, radius r, the number of sampoing points p, mapping manners mapping, hitogram 'h'
         outputs: the cldp_d histogram of an image
      b. test_cldp_d_outex=test_clbp_d_outex(p,r):
         inputs: radius r, the number of sampoing points p
         outputs: classification accuray (CA) based on nearest neighbor classifier (NNC), compuataion time under a certain (P, R) for one test suit
      c. test_cldp:
         outputs: test cldp-based classification performance on each test suit using various combinations of (P, R) values
      d. getmapping:
         three selections: 'u2' for uniform 2, 'ri' for rotation-invariant, 'riu2' for uniform 2 and rotatoin-invariant
      e. ClassifyOnNN(DM,trainClassIDs,testClassIDs):
         input:  "DM" is a m*n distance matrix, m is the number of test samples, n is the number of training samples, 'trainClassIDs' and 'testClassIDs'
                stores the class ID of training and test samples
         output: classifcation accuracy
-----------------------------------------------------------------------------------------------------------------------------------------
3. Results reproduction
   PS: we run Matlab2014b codes on Intel Core i7-4790K 4.00GHz

   1) Original experimental results: ...\CLDP\Outex\Results\CDLP-based Classification Results_20160128.xlsx
      a. 1st subsheet (CLBP VS CLDP): comparisons between CLBP and CLDP on classification accuracy for each combination scheme under a certain (P, R)
         Each row represents a combination scheme and each colomn represents a certain (P, R) for a test suit.
         For example:
         CLDP_S/M/D/C(riu2): run matlab codes under ...\CLDP\Outex\Test_TC12\Test_TC12_000\Test_cldp\Test_cldp_smdcjoint;
         The codes return accuracy for the CLDP_S/M/D/C-based texture classifictition under various (P, R) values on test suit TC12_000("t184").
      b. 2nd subsheet (CLBP VS CLDP): comparisons between CLBP and CLDP on computation time for each combination scheme under a certain (P, R)
   2) Table 1: Average classification accuracy (%) of CLBP and CLDP on TC10 (inca) and TC12 (t184 and horizon) using different combination schemes
      This table can be found from the 1st subsheet in ...\CLDP\Outex\Results\CDLP-based Classification Results_20160128.xlsx      
   3) Table 2: Classification accuracy (%) of state-of-the-art texture descriptors on TC10 (inca) and TC12 (t184 and horizon)
      This table can be found from the 4th subsheet in ...\CLDP\Outex\Results\CDLP-based Classification Results_20160128.xlsx
-----------------------------------------------------------------------------------------------------------------------------------------
