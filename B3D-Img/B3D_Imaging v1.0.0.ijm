macro "Bioloc3D Macro Action Tool - N66C45fCeefD2cDb5Dc1Dd1Dd9DdeDe1DecC99fC77fCeffD5dD7eCccfDa6DdcDe9C77fD46D56D57D65D67D78D84D88D89D93D98D99Da3Da7Da8Da9DaaDb7DbaDc6Dc7DcbDd6DdbDe3De4De5De6DeaCaafD4cC89fCfffCddfD1bC66fC9afC88fCfffD4dD59D7aD82D96D9bDbcDbdCcdfD1aD6dCabfD5aC89fD3bD4bD5bD6cD7cD8dDaeCdefD39D49D6aD8bC56fC99fD77D79D83C88fD94Dc2Dd2Dd5Dd7DdaDe2CccfDabDccCabfC99fD9aDbbCddfD27D35D48D54D76C67fDeeC9afD2bD5cD7dC88fD66D97Db6Db9DebCddfD29D69D73D8aD92Dc9CbcfD9cDbeCeefD95Db4Dc4Dd8C45fC9afD2aD3aD4aD6bD8cD9dC77fD36D47D55D68D74D75Db3Db8Dc3DcaDd3CbcfCabfCaafD37D45D58D64Dd4CbbfD87Dc5DedC56fCbbfD26D85Da4De7CeefC8afD9eCaafDa2Db2Dc8CbbfD7bC55fCccfD3cD8eDadBf0C45fD0eD7bD8dD8eCeefD07D08D0cD12D27C99fD6aC77fD9cD9dD9eCeffCccfD0bD44D65C77fD03D04D05D0aD0dD14D15D19D25D29D35D38D45D46D47D48D56D57CaafD5aC89fD7aCfffCddfC66fC9afC88fCfffD1bD3aD54D59D75D77D9aDacDadDaeCcdfCabfC89fCdefD6eC56fD4cC99fD24D3dD58C88fD06CccfD2aD2eD49D4dD5dCabfD1cC99fD37D39CddfD23C67fD2cD4bC9afC88fD09D13D1aD28D36D55CddfD76CbcfCeefD4aD68C45fD6bD7cD8cC9afC77fD66CbcfCabfCaafD26D67CbbfD18D34D8aC56fD1eD2dD5cD7dD7eD8bCbbfD02D6dCeefD2bC8afCaafD16D3bCbbfD9bC55fD1dD3cD5bD6cCccfB0fC45fD00D01D02D03D04D05D06D07CeefD20D21D22D23D24D34D43D92C99fC77fD35CeffCccfC77fCaafC89fD46D62D90CfffCddfC66fD10D11D12D13D14D15D55C9afC88fD08D27D82CfffD09D28D52Da0CcdfD37CabfC89fCdefD60C56fC99fD53C88fCccfD18D65CabfC99fCddfD61D83C67fD64D73C9afC88fCddfD56D91CbcfD74CeefC45fC9afC77fCbcfCabfCaafD44CbbfC56fD17D36D63D70D71D81CbbfCeefC8afCaafD25CbbfC55fD16D26D45D54D72D80CccfNf0C45fCeefD31Dc0Dd0Dd1Dd2Dd3Dd4Dd5Dd6Dd7Dd8C99fC77fDe8CeffCccfC77fCaafC89fCfffD10CddfD50D51D56D62D74D77D80Da8Dc3Dc7C66fC9afD22C88fCfffD35D46D52D63D67D73D88Dd9CcdfD42Dc1Dc2Dc5Dc6CabfD45C89fD33D44D54D65D75D76D82D86D91D92D93D96Da0Da1Da2Da3Da4Da5Da6Da7Db1Db2Db5Db6CdefD12D70D84Dc4C56fC99fC88fCccfCabfD23C99fCddfD98C67fDe0De1De2De3De4De5De6De7C9afD32Db4Db7C88fCddfD53Db8De9CbcfCeefC45fC9afD43D61D71D81D90D94D95D97Db3C77fCbcfD21CabfD64D66D72D83D85D87Db0CaafCbbfC56fCbbfCeefD24C8afD55CaafCbbfD34D60C55fCccfD11"{
//Bioloc3D : Macro version
version="Bioloc3D 2.1.2";
	
//Analysis parameters
	//Plugins set-up

	//Inputs
GUI1_main();

pathway_save= Dialog.getString();
suffix_cond=Dialog.getNumber();
headless=Dialog.getRadioButton();
liststack = getFileList(pathway_save); 

GUI2_main();

tC1= Dialog.getNumber();
minC1= Dialog.getNumber();
maxC1= Dialog.getNumber();
tC2= Dialog.getNumber();
minC2= Dialog.getNumber();
maxC2= Dialog.getNumber();
simplesegmentation=Dialog.getRadioButton();
controlcoloc=Dialog.getRadioButton();
tControlcoloc= Dialog.getNumber();
minCo= Dialog.getNumber();
maxCo= Dialog.getNumber();
addDetection=Dialog.getRadioButton();
minSoma= Dialog.getNumber();
tControlsoma= Dialog.getNumber();

GUI_inputs();

	//Analysis : Split & renaming channels

for(x=0; x<lengthOf(liststack);x++){
run("Set 3D Measurements", "volume surface nb_of_obj._voxels nb_of_surf._voxels integrated_density mean_gray_value std_dev_gray_value median_gray_value minimum_gray_value maximum_gray_value centroid mean_distance_to_surface std_dev_distance_to_surface median_distance_to_surface centre_of_mass bounding_box dots_size=5 font_size=10 white_numbers store_results_within_a_table_named_after_the_image_(macro_friendly) redirect_to=none");	
liststack_name=liststack[x];
stack_name = substring(liststack_name, 0, lengthOf(liststack_name)-3);

if (headless=="Yes") {
setBatchMode(true);	
}
if (headless=="No") {
setBatchMode(false);	
}	
open(pathway_save+stack_name+"tif");
name=getTitle();
Stack.getDimensions(width, height, channels, slices, frames);
Stack.getUnits(X, Y, Z, Time, Value);
run("Split Channels");
for (i = 1; i <= channels; i++) {
	selectWindow("C" + i + "-" + name);
	rename("C"+i);
}
Additional_C();
getVoxelSize(width, height, depth, unit);

	//Analysis : Stack stat.	
Stack_stat();

	//Analysis : Individualization channels elements 
	for (n = 1; n <=2; n++) {

		//Analysis : Check 3D Object Counter
		Check_3DObj_C();
		CheckObj= File.openAsString(pathway_save + "Check_C"+n+".txt");	
		//note: indexOf(string, "text") > -1 if string contains "text" and lengthOf string = 42 when written with 2digits 
		if (indexOf(CheckObj, "Nb obj in range size =0") > -1 && lengthOf(CheckObj) < 42){
			if (n==1) {
			Table_Check_C();
			}
			if (n==2) {
			Table_Check_C();
			}
		}
		//Analysis : Individualization
		else {
			if (simplesegmentation=="Yes") {
			Indiv_C_simplified();
			}
			if (simplesegmentation=="No") {
			Indiv_C();
			}
			//Analysis : Check Soma detection
			if (addDetection=="Yes"){
			Check_Soma();
			CheckObjSoma= File.openAsString(pathway_save + "Check_Soma_C"+n+".txt");	
				if (indexOf(CheckObjSoma, "Nb obj in range size =0") > -1 && lengthOf(CheckObjSoma) < 42){
					for (n = 1; n <= 2; n++) {
					Table_Check_Soma();
					}
				}
				else {
				Indiv_Soma();
  				}	
			}
			if (addDetection=="No"){	
			Table_Soma_empty();	
			}
		}
	}
	//Analysis : Interactions between channels
		//Analysis : Check 3D Object Counter			
		CheckObjC1= File.openAsString(pathway_save + "Check_C1.txt");
		CheckObjC2= File.openAsString(pathway_save + "Check_C2.txt");
		if (indexOf(CheckObjC1, "Nb obj in range size =0") > -1 && lengthOf(CheckObjC1) < 42){	
			for (n = 1; n < 2; n++) {
			Table_Check_Global_Coloc();
			}
			for (n = 1; n <= 2; n++) {
			Table_Check_CxCo();
			}
		close("*");
		Parameters();	 	
		CloseTables();
		}
		else {	
			if (indexOf(CheckObjC2, "Nb obj in range size =0") > -1 && lengthOf(CheckObjC2) < 42){
				for (n = 1; n < 2; n++) {
				Table_Check_Global_Coloc();
				}
				for (n = 1; n <= 2; n++) {
				Table_Check_CxCo();
				}	
			close("*");	
			Parameters();	 	
			CloseTables();
			}
			else {	
			//Analysis : Overall coloc(s)	
				for (n = 1; n <= 2; n++) {
				Threshold_C();
				}
				for (n = 1; n < 2; n++) {
				Create_Global_Co();
				Control_coloc();
				}
				Check_3DObj_Co();
				CheckObj_GlobalCo= File.openAsString(pathway_save + "Check_GlobalCo.txt");
					if (indexOf(CheckObj_GlobalCo, "Nb obj in range size =0") > -1 && lengthOf(CheckObj_GlobalCo) < 42){	
						for (n = 1; n < 2; n++) {
						Table_Check_Global_Coloc();
						}
						for (n = 1; n <= 2; n++) {
						Table_Check_CxCo();
						}
						Parameters();	 	
						CloseTables();
							if (headless=="Yes") {
         					close("*"); 
         					}
							if (headless=="No") {
							run("Tile");	
							}
						}	
					else {
						for (n = 1; n < 2; n++) {
						Indiv_Co();
						}
						//Analysis : Coloc(s) per channel
						for (n = 1; n <= 2; n++) {
						Indiv_CxCo_Vol();
						Indiv_CxCo_Nb();
						CxCo_NbxVol();		
						}
						//Analysis : Save parameters used for the analysis
						Parameters();	
						//Analysis : End 	
						CloseTables();
							if (headless=="Yes") {
         					close("*"); 
         					}
							if (headless=="No") {
							run("Tile");	
							}
					}	
			}
		}
setBatchMode(false);			
}
//Functions
	//Function : Inputs
function GUI1_main() { 
Dialog.create("Bioloc3D");
		Dialog.setInsets(0,0,0);
	Dialog.addMessage("# Section 1 : Load and save ", 14, "#2E74AF");
		Dialog.setInsets(12,0,0);
	Dialog.addMessage("Directory to load tif & save excel files :");
		Dialog.setInsets(5,0,0);
	Dialog.addDirectory("", "");
	Dialog.setInsets(5,0,0);
	Dialog.addMessage("Note : folder must contain only tif files", 11.5, "#000000");
		Dialog.setInsets(10,0,0);
	Dialog.addMessage("Excel name (e.g. Cond1_1) :");
		Dialog.setInsets(10,0,0);
	Dialog.addNumber("Condition number",1,0,2,"");
		Dialog.setInsets(15,0,0);
	Dialog.addMessage("# Section 2 : Display results ", 14, "#AF2E3A");	
	headless_choice = newArray("Yes","No");
		Dialog.setInsets(15,0,0);
	Dialog.addRadioButtonGroup("Running the macro in headless mode :", headless_choice, 1, 1, "Yes");
		Dialog.setInsets(7,0,0);
	Dialog.addMessage("Note :", 11.5, "#000000");
		Dialog.setInsets(2,20,0);
	Dialog.addMessage("- Yes: if number of files > 1", 11.5, "#000000");
		Dialog.setInsets(5,20,0);
	Dialog.addMessage("- No: if number of file = 1 (advised for proofreading)", 11.5, "#000000");
	Dialog.addHelp("https://github.com/tdhellemmes");
	Dialog.show();
}
function GUI2_main() { 
Dialog.createNonBlocking("Bioloc3D");
		Dialog.setInsets(0,0,0);
	Dialog.addMessage("# Section 3 : Discriminate elements  ", 14, "#2EAF38");
		Dialog.setInsets(15,0,0);
	Dialog.addMessage("Channel 1 (C1)", 13.5, "#000000");
		Dialog.setInsets(5,0,0);
	Dialog.addSlider("Threshold", 0, 255, "0");
		Dialog.setInsets(5,0,0);
	Dialog.addNumber("Min. C1","",0,8,"(microns^3)");
		Dialog.setInsets(5,0,0);
	Dialog.addNumber("Max. C1","",0,8,"(microns^3)");
		Dialog.setInsets(15,0,0);
	Dialog.addMessage("Channel 2 (C2)", 13.5, "#000000");
		Dialog.setInsets(5,0,0);
	Dialog.addSlider("Threshold", 0, 255, "0");
		Dialog.setInsets(5,0,0);
	Dialog.addNumber("Min. C2","",0,8,"(microns^3)");
		Dialog.setInsets(5,0,0);
	Dialog.addNumber("Max. C2","",0,8,"(microns^3)");
		Dialog.setInsets(5,0,0);
	choice_YesNo = newArray("Yes","No");
	Dialog.addRadioButtonGroup("Simple segmentation of C1 & C2 :", choice_YesNo, 1, 1, "No");
		Dialog.setInsets(11,0,0);
	Dialog.addMessage("    *****************          ***          *****************    ");
		Dialog.setInsets(9,0,0);
	Dialog.addMessage("Colocalization (Co)", 13.5, "#000000");
		Dialog.setInsets(5,0,0);
	Dialog.addRadioButtonGroup("Check colocalization with an additional channel :", choice_YesNo, 1, 1, "Yes");
		Dialog.setInsets(5,0,0);
	Dialog.addSlider("Threshold", 0, 255, "0");
		Dialog.setInsets(5,0,0);
	Dialog.addNumber("Min. Co","",0,5,"(microns^3)");
		Dialog.setInsets(5,0,0);
	Dialog.addNumber("Max. Co","",0,5,"(microns^3)");
		Dialog.setInsets(11,0,0);
	Dialog.addMessage("    *****************          ***          *****************    ");
		Dialog.setInsets(9,0,0);
	Dialog.addMessage("Additional counting of soma", 13.5, "#000000");
		Dialog.setInsets(10,0,0);
		Dialog.addRadioButtonGroup("Complete counting with an additional channel :", choice_YesNo, 1, 1, "Yes");
		Dialog.setInsets(5,0,0);
	Dialog.addNumber("Min. area","",0,8,"(microns^2)");
		Dialog.setInsets(5,0,0);
		Dialog.addSlider("Threshold", 0, 255, "0");
	Dialog.addHelp("https://github.com/tdhellemmes");
	Dialog.show();
}
function GUI_inputs() { 
print("Pathway: "+pathway_save);
print("Cond: "+suffix_cond);
print("Headless: "+ headless);  
print("Thr C1: "+tC1); 
print("Min C1: "+minC1); 
print("Max C1: "+maxC1); 
print("Thr C2: "+tC2); 
print("Min C2: "+minC2); 
print("Max C2: "+maxC2); 
print("Simple segmentation mode: "+simplesegmentation);
print("Thr Co: "+tControlcoloc); 
print("Min Co: "+minCo); 
print("Max Co: "+maxCo); 
print("Additional detection: "+addDetection);
print("Min Soma: "+minSoma);
print("Thr Soma: "+tControlsoma);
selectWindow("Log");
saveAs("Text",  pathway_save + "Parameters"+suffix_cond+"");
close("Log");
}


	//Function : Display paramaters
function Parameters() { 
value_threshold= newArray(tC1,tC2,tControlcoloc,tControlsoma);
value_min= newArray(minC1,minC2,minCo,minSoma,minCo,minSoma);
value_max= newArray(maxC1,maxC2,maxCo);
value_label= newArray("C1","C2","Control_Coloc","Control_Soma","Coloc","Soma");
value_unit=newArray(X);
value_version= newArray(version);
Table.create("Analysis parameters");
	Table.setColumn("Label", value_label);
	Table.setColumn("Threshold", value_threshold);
	Table.setColumn("Min.", value_min);
	Table.setColumn("Max.", value_max);
	Table.setColumn("Macro version", value_version);
Table.rename("Analysis parameters", "Results");
Excel_Parameters();
Table.rename("Results", "Table_Parameters");			
}
	//Function : Save next results to excel
function Excel_C() {
	i = n+1;
	run("Read and Write Excel", "dataset_label=[Objects map of C"+n+"] file=["+pathway_save+"Cond"+suffix_cond+"_"+x+1+".xlsx] sheet=C" + n +" " +i);}
function Excel_Soma() {
	i = n+1;
	run("Read and Write Excel", "dataset_label=[Counting of soma] file=["+pathway_save+"Cond"+suffix_cond+"_"+x+1+".xlsx] sheet=C" + n +" " +i);}		
function Excel_GlobalColoc() {
	i = n+1;
	run("Read and Write Excel", "dataset_label=[Objects map of Global coloc] file=["+pathway_save+"Cond"+suffix_cond+"_"+x+1+".xlsx] sheet=Global_Coloc_(Co) " +i);}
function Excel_ControlColoc() {
	i = n+1;
	run("Read and Write Excel", "dataset_label=[Objects map of Control coloc] file=["+pathway_save+"Cond"+suffix_cond+"_"+x+1+".xlsx] sheet=Global_Coloc_(Co) " +i);}	
function Excel_CxGlobalCo() {
	i = n+2;
	run("Read and Write Excel", "dataset_label=[GlobalColoc on elements of C"+n+"] file=["+pathway_save+"Cond"+suffix_cond+"_"+x+1+".xlsx] sheet=C"+n+"xCo " +i);}
function Excel_CxControlCo() {
	i = n+2;
	run("Read and Write Excel", "dataset_label=[ControlColoc on elements of C"+n+"] file=["+pathway_save+"Cond"+suffix_cond+"_"+x+1+".xlsx] sheet=C"+n+"xCo " +i);}	
function Excel_Parameters() {
	i = n+3;
	run("Read and Write Excel", "dataset_label=[Analysis parameters _ "+pathway_save+stack_name+"] file=["+pathway_save+"Cond"+suffix_cond+"_"+x+1+".xlsx] sheet=Parameters " +i);}
		
	//Function : Check object(s) to count
function Check_3DObj_C() { 
selectWindow("C"+n);
getPixelSize(unit, pw, ph, pd);	
		//values : unit to obj. voxel 
		minobjC1=minC1/(ph*pw*pd);
		minobjC1_integer=Math.round(minobjC1);	
		maxobjC1=maxC1/(ph*pw*pd);
		maxobjC1_integer=Math.round(maxobjC1);	
		minobjC2=minC2/(ph*pw*pd);
		minobjC2_integer=Math.round(minobjC2);	
		maxobjC2=maxC2/(ph*pw*pd);
		maxobjC2_integer=Math.round(maxobjC2);	
if (n==1) {
	run("3D Simple Segmentation", "low_threshold="+tC1+" min_size="+minobjC1_integer+" size max_size="+maxobjC1_integer+"");	}	
if (n==2) {	
	run("3D Simple Segmentation", "low_threshold="+tC2+" min_size="+minobjC2_integer+" size max_size="+maxobjC2_integer+"");	}		
selectWindow("Log");
saveAs("Text",  pathway_save + "Check_C"+n+"");
close("Seg");
close("Bin");
close("Log");
}
function Table_Check_C(){
nb="0";
value= newArray(nb);
Table.create("No object C");
	Table.setColumn("Label");
	Table.setColumn("Volume ("+X+"^3)",value);
	Table.setColumn("Surface ("+X+"^2)",value);
	Table.setColumn("Nb of obj. voxels",value);	
	Table.setColumn("Nb of surf. voxels",value);
	Table.setColumn("IntDen",value);
	Table.setColumn("Mean",value);		
Table.rename("No object C", "Results");
	run("Summarize");
Excel_C();
Table.rename("Results", "Table_No object C"+n);				
}
function Check_3DObj_Co() { 
if(controlcoloc=="No"){
selectWindow("Global coloc");
getPixelSize(unit, pw, ph, pd);	
		//values : unit to obj. voxel 
		minobjCo=minCo/(ph*pw*pd);
		minobjCo_integer=Math.round(minobjCo);	
selectWindow("Global coloc");
run("3D Simple Segmentation", "low_threshold=1 min_size=1 size max_size=-1");
selectWindow("Log");
saveAs("Text",  pathway_save + "Check_GlobalCo");
close("Seg");
close("Bin");
close("Log");
}
if(controlcoloc=="Yes"){
selectWindow("Global coloc");
getPixelSize(unit, pw, ph, pd);	
		//values : unit to obj. voxel 
		minobjCo=minCo/(ph*pw*pd);
		minobjCo_integer=Math.round(minobjCo);	
selectWindow("Global coloc");
run("3D Simple Segmentation", "low_threshold=1 min_size=1 size max_size=-1");
selectWindow("Log");
saveAs("Text",  pathway_save + "Check_GlobalCo");
close("Seg");
close("Bin");
close("Log");

selectWindow("Control coloc");
getPixelSize(unit, pw, ph, pd);	
		//values : unit to obj. voxel 
		minobjCo=minCo/(ph*pw*pd);
		minobjCo_integer=Math.round(minobjCo);	
selectWindow("Control coloc");
run("3D Simple Segmentation", "low_threshold=1 min_size=1 size max_size=-1");
selectWindow("Log");
saveAs("Text",  pathway_save + "Check_ControlCo");
close("Seg");
close("Bin");
close("Log");
}
}


function Table_Check_Global_Coloc(){
nb="0";
empty=newArray("", "");
value= newArray(nb);
	//For global coloc (gc)
Table.create("No object Global_coloc");
	Table.setColumn("Label");
	Table.setColumn("Volume ("+X+"^3)",value);
	Table.setColumn("Surface ("+X+"^2)",value);
	Table.setColumn("Nb of obj. voxels",value);	
	Table.setColumn("Nb of surf. voxels",value);											
Table.rename("No object Global_coloc", "Results");
	run("Summarize");
Excel_GlobalColoc();
Table.rename("Results", "Table_No object Global_coloc");	
	//For coloc coloc (cc)
Table.create("No object Control_coloc");
	Table.setColumn("Label");
	Table.setColumn("Volume ("+X+"^3)",value);
	Table.setColumn("Surface ("+X+"^2)",value);
	Table.setColumn("Nb of obj. voxels",value);	
	Table.setColumn("Nb of surf. voxels",value);											
Table.rename("No object Control_coloc", "Results");
	run("Summarize");
Excel_GlobalColoc();
Table.rename("Results", "Table_No object Control_coloc");	
}
function Table_Check_Control_Coloc(){
nb="0";
empty=newArray("", "");
value= newArray(nb);
Table.create("No object Control_coloc");
	Table.setColumn("Label");
	Table.setColumn("Volume ("+X+"^3)",value);
	Table.setColumn("Surface ("+X+"^2)",value);
	Table.setColumn("Nb of obj. voxels",value);	
	Table.setColumn("Nb of surf. voxels",value);											
Table.rename("No object Control_coloc", "Results");
	run("Summarize");
Excel_GlobalColoc();
Table.rename("Results", "Table_No object Control_coloc");
}

function Table_Check_Control_Coloc_MGV(){
nb="0";
empty=newArray("", "");
value= newArray(nb);
Table.create("Table_MeanGrayValue_ControlColoc on C"+n);
	Table.setColumn("Label", empty);
	Table.setColumn("IntensityAvg",value);											
}

function Table_Check_CxCo(){
nb="0";
empty=newArray("", "");
value= newArray(nb);
	//For global coloc (gc)
Table.create("No object CxGlobalCo");
	Table.setColumn("C"+n+"",value);
	Table.setColumn("Nbs of coloc on C"+n+"",value);
	Table.setColumn("Total volume of coloc "+X+"3",value);	
	Table.setColumn("", empty);
	Table.setColumn("Label Global_Coloc", empty);
	Table.setColumn("Mean Gray value GlobalColoc area on C"+n, value);	
Table.rename("No object CxGlobalCo", "Results");
	run("Summarize");
Excel_CxGlobalCo();
Table.rename("Results", "Table_No object C"+n+"xGlobalCo");	
	//For control coloc (cc)
Table.create("No object CxControlCo");
	Table.setColumn("C"+n+"",value);
	Table.setColumn("Nbs of coloc on C"+n+"",value);
	Table.setColumn("Total volume of coloc "+X+"3",value);	
	Table.setColumn("", empty);
	Table.setColumn("Label Control_Coloc", empty);
	Table.setColumn("Mean Gray value Controlcoloc area on C"+n, value);	
Table.rename("No object CxControlCo", "Results");
	run("Summarize");
Excel_CxControlCo();
Table.rename("Results", "Table_No object C"+n+"xControlCo");	
}
function Check_Soma() { 
selectWindow("C"+n);
getPixelSize(unit, pw, ph, pd);		
run("Z Project...", "projection=[Max Intensity]");
	//values : unit to obj. voxel 
	minobjsoma=minSoma/(pw*ph);
	minobjsoma_integer=Math.round(minobjsoma);
if (n==1) {
	run("3D Simple Segmentation", "low_threshold="+2*tC1+" min_size="+minobjsoma_integer+" size max_size=-1");	}	
if (n==2) {
	run("3D Simple Segmentation", "low_threshold="+2*tC2+" min_size="+minobjsoma_integer+" size max_size=-1");	}		
selectWindow("Log");
saveAs("Text",  pathway_save + "Check_Soma_C"+n+"");
close("MAX_C"+n);
selectWindow("Bin");
rename("MAX_C"+n);
close("Seg");
close("Log");
}
function Table_Check_Soma(){
nb="0";
value= newArray(nb);
Table.create("No object Soma");
	Table.setColumn("C"+n+"",value);
	Table.setColumn("Nbs of soma in C"+n+"",value);
	Table.setColumn("Mean Area in "+X+"2",value);	
Table.rename("No object Soma", "Results");
	run("Summarize");
Excel_Soma();
Table.rename("Results", "Table_No object Soma"+n+"");				
}
	//Function : Stat. stack
function Stack_stat() { 
run("Duplicate...", "title=[Stack stat.] duplicate"); 
name=getTitle();
selectWindow(name);		
selectWindow("Stack stat.");
	run("Measure Stack...");
	selectWindow("Results");
	size=Table.size;
	area=Table.getString("Area", size-1); 
	thickness=Table.getString(X+"s", size-1);
	val_area= newArray(area);
	val_thick= newArray(thickness); 
	close("Results");
	Table.create("Stack stat.");
		Table.setColumn("Area",val_area);
		Table.setColumn("Thickness",val_thick);
		Table.applyMacro("Volume ="+area+"*"+thickness+"");
	Table.rename("Stack stat.", "Results");
		run("Summarize");
		i = 1;
		run("Read and Write Excel", "dataset_label=[Stack stat _ "+pathway_save+stack_name+"] file=["+pathway_save+"Cond"+suffix_cond+"_"+x+1+".xlsx] sheet=Stack_ " +i);
	Table.rename("Results", "Table_Stack stat.");
	close("Stack stat.");	
}
	//Function : Create additionnal channels to count
function Additional_C() { 
	if (controlcoloc=="Yes" && addDetection=="Yes") {
	selectWindow("C3");
	rename("Control_coloc");
	selectWindow("C4");
	rename("Control_soma");
	}
	if (controlcoloc=="No" && addDetection=="Yes") {
	selectWindow("C3");
	rename("Control_soma"); 
	}
	if (controlcoloc=="Yes" && addDetection=="No") {
	selectWindow("C3");
	rename("Control_coloc");
	}
	else {
	}
}
	//Function : Individualization of elements per channel
function Indiv_C() {	
selectWindow("C"+n);
getPixelSize(unit, pw, ph, pd);		 
		//values : unit to obj. voxel 
		minobjC1=minC1/(ph*pw*pd);
		minobjC1_integer=Math.round(minobjC1);	
		maxobjC1=maxC1/(ph*pw*pd);
		maxobjC1_integer=Math.round(maxobjC1);	
		minobjC2=minC2/(ph*pw*pd);
		minobjC2_integer=Math.round(minobjC2);	
		maxobjC2=maxC2/(ph*pw*pd);
		maxobjC2_integer=Math.round(maxobjC2);	
	if (n==1) {
run("3D object counter...", "threshold=" +tC1+ " min.="+minobjC1_integer+" max.="+maxobjC1_integer+" objects statistics");
	}	
	if (n==2) {	
run("3D object counter...", "threshold=" +tC2+ " min.="+minobjC2_integer+" max.="+maxobjC2_integer+" objects statistics");
	}		
selectWindow("Objects map of C"+n);
run("glasbey on dark");
Table_C();
}
function Table_C() {	
selectWindow("Statistics for C"+n);
volumeC=Table.getColumn("Volume ("+X+"^3)");
surfaceC=Table.getColumn("Surface ("+X+"^2)");
ObjvoxC=Table.getColumn("Nb of obj. voxels");
SurfvoxC=Table.getColumn("Nb of surf. voxels");
intden=Table.getColumn("IntDen");
meangvalueC=Table.getColumn("Mean");
serieTotalC=Table.size;
print(serieTotalC);
TotalC=split(getInfo("log"));
close("Log");
Table.create("Logtable");
for (i=0;i<TotalC.length;i+=2) {
Table.set("Total C",i,TotalC[i]); 
}
totalC=Table.getColumn("Total C");
Table.rename("Logtable", "Table_logC"+n);
close("Statistics for C"+n);
Table.create("Results");
	Table.setColumn("Total C"+n+"",totalC);
	Table.setColumn("Volume ("+X+"^3)",volumeC);
	Table.setColumn("Surface ("+X+"^2)",surfaceC);
	Table.setColumn("Nb of obj. voxels",ObjvoxC);	
	Table.setColumn("Nb of surf. voxels",SurfvoxC);
	Table.setColumn("IntDen",intden);
	Table.setColumn("Mean",meangvalueC);							
	run("Summarize");
Excel_C();
Table.rename("Results", "Table_C"+n);
}
function Indiv_C_simplified(){
selectWindow("C"+n);
getPixelSize(unit, pw, ph, pd);
		//values : unit to obj. voxel 
		minobjC1=minC1/(ph*pw*pd);
		minobjC1_integer=Math.round(minobjC1);	
		maxobjC1=maxC1/(ph*pw*pd);
		maxobjC1_integer=Math.round(maxobjC1);	
		minobjC2=minC2/(ph*pw*pd);
		minobjC2_integer=Math.round(minobjC2);	
		maxobjC2=maxC2/(ph*pw*pd);
		maxobjC2_integer=Math.round(maxobjC2);
if (n==1) {
	run("3D Simple Segmentation", "low_threshold="+tC1+" min_size="+minobjC1_integer+" max_size="+maxobjC1_integer+"");	}	
if (n==2) {	
	run("3D Simple Segmentation", "low_threshold="+tC2+" min_size="+minobjC2_integer+" max_size="+maxobjC2_integer+"");	}		
selectWindow("Log");
saveAs("Text",  pathway_save + "Simplified_C"+n+"");
selectWindow("Seg");
rename("Objects map of C"+n);
run("glasbey on dark");
close("Bin");
close("Log");
Table_C_simplified();
}
function Table_C_simplified() {	
filesimpleC=pathway_save+"Check_C"+n+".txt";
txt_filesimpleC = File.openAsString(filesimpleC);
rows = split(txt_filesimpleC, "\n");
numbertotalC = split(rows[1], "=");
totalsimpleC=numbertotalC[1];
ArrayTotalsimpleC=newArray(totalsimpleC);
empty=newArray("NaN");
Table.create("Results");
	Table.setColumn("Label",empty);
	Table.setColumn("Total C"+n+"",ArrayTotalsimpleC);
	Table.setColumn("Volume ("+X+"^3)",empty);
	Table.setColumn("Surface ("+X+"^2)",empty);
	Table.setColumn("Nb of obj. voxels",empty);	
	Table.setColumn("Nb of surf. voxels",empty);
	Table.setColumn("IntDen",empty);
	Table.setColumn("Mean",empty);							
	run("Summarize");
Excel_C();
Table.rename("Results", "Table_C"+n);
	}	
function Indiv_Soma() {	
selectWindow("MAX_C"+n);
if (n==1) {	
run("Remove Outliers...", "radius=5 threshold="+tC1+" which=Bright stack");}
if (n==2) {	
run("Remove Outliers...", "radius=5 threshold="+tC2+" which=Bright stack");}
		//values : unit to obj. voxel 
		getPixelSize(unit, pw, ph, pd);
		minobjsoma=minSoma/(pw*ph);
		minobjsoma_integer=Math.round(minobjsoma);
	run("3D Simple Segmentation", "low_threshold=1 min_size="+minobjsoma_integer+" max_size=-1");		
	selectWindow("Seg");
	run("Morphological Filters", "operation=Dilation element=Disk radius=5");
	selectWindow("Seg-Dilation");
	run("8-bit");
	setAutoThreshold("Default dark");
	setThreshold(1, 65535);
	setOption("BlackBackground", false);
	run("Convert to Mask", "method=Default background=Dark black");
	run("Watershed");
	rename("Soma_C"+n);
	close("Seg");
	close("Bin");
	close("Log");
	if(addDetection=="Yes" && n==1){
	selectWindow("Control_soma");
		//values : unit to obj. voxel 
		getPixelSize(unit, pw, ph, pd);
		minobjsoma=minSoma/(pw*ph);
		minobjsoma_integer=Math.round(minobjsoma);		
	run("Z Project...", "projection=[Max Intensity]");
	run("3D Simple Segmentation", "low_threshold="+tControlsoma+" min_size="+minobjsoma_integer+" max_size=-1");		
	selectWindow("Bin");
	run("Invert LUT");
	run("Fill Holes");
	run("Watershed");
	rename("MAX_Control_soma_binary");
	close("Seg");
	close("Log");
	//mergeControl&soma_for_proofreading
	run("Merge Channels...", "c1=MAX_Control_soma_binary c2=Soma_C1 create keep");
	rename("Control_Soma_C1");
	//AnalyzeSoma
	selectWindow("Soma_C1");
	run("Analyze Particles...", "size="+minSoma+"-Infinity show=[Overlay Masks] display clear summarize composite");
	Table.rename("Summary", "Results_Soma_C"+n);	
	Table_Soma();
	}
	if(addDetection=="Yes" && n==2){
	//mergeControl&soma_for_proofreading
	run("Merge Channels...", "c1=MAX_Control_soma_binary c2=Soma_C2 create keep");
	rename("Control_Soma_C2");
	//AnalyzeSoma
	selectWindow("Soma_C2");
	run("Analyze Particles...", "size="+minSoma+"-Infinity show=[Overlay Masks] display clear summarize composite");
	Table.rename("Summary", "Results_Soma_C"+n);	
	Table_Soma();
	}
close("MAX_C"+n);	
}
function Table_Soma() {	
selectWindow("Results_Soma_C"+n);
countsoma=Table.getColumn("Count");
totalarea=Table.getColumn("Total Area");
meanarea=Table.getColumn("Average Size");	
close("Results_Soma_C"+n);						
Table.create("Table_Soma_C"+n);
	Table.setColumn("Nb of soma", countsoma);
	Table.setColumn("Total area "+X+"^2", totalarea);
	Table.setColumn("Mean area "+X+"^2", meanarea);
	Table.rename("Table_Soma_C"+n, "Results");
Excel_Soma();
Table.rename("Results", "Table_Soma_C"+n);
}
function Table_Soma_empty() {	
emptyNaN=newArray("NaN");	
Table.create("Table_Soma_C"+n);
	Table.setColumn("Count", emptyNaN);
	Table.setColumn("Nb of soma", emptyNaN);
	Table.setColumn("Total area "+X+"^2", emptyNaN);
	Table.setColumn("Mean area "+X+"^2", emptyNaN);
	Table.rename("Table_Soma_C"+n, "Results");
Excel_Soma();
Table.rename("Results", "Table_Soma_C"+n);
}

	//Function : "Overall coloc(s)"
function Threshold_C() { 
selectWindow("Objects map of C"+n);	
run("Duplicate...", "title=[Threshold_Objects map of C"+n+"] duplicate");
setAutoThreshold("Default dark");
setThreshold(1, 65535);
setOption("BlackBackground", false);
		run("Convert to Mask", "method=Default background=Dark black");
}		
function Create_Global_Co()	{ 
imageCalculator("AND create stack", "Threshold_Objects map of C"+n,"Threshold_Objects map of C"+n+1);
selectWindow("Result of Threshold_Objects map of C"+n);
rename("Global coloc");
close("Threshold_Objects map of C"+n);
close("Threshold_Objects map of C"+n+1);		
}
function Control_coloc() { 
selectWindow("Global coloc");
getPixelSize(unit, pw, ph, pd);	
		//values : unit to obj. voxel 
		minobjCo=minCo/(ph*pw*pd);
		minobjCo_integer=Math.round(minobjCo);	
		maxobjCo=maxCo/(ph*pw*pd);
		maxobjCo_integer=Math.round(maxobjCo);	
	if(controlcoloc=="Yes"){
	//Global coloc (gc)
	selectWindow("Global coloc");
	run("Divide...", "value=255 stack");
	//Control coloc (cc)
	selectWindow("Control_coloc");
	run("3D Simple Segmentation", "low_threshold="+tControlcoloc+" min_size="+minobjCo_integer+" max_size="+maxobjCo_integer+"");	
	selectWindow("Seg");
	setAutoThreshold("Default dark");
	setThreshold(1, 65535, "raw");
	setOption("BlackBackground", false);
	run("Convert to Mask", "method=Default background=Dark black");
	run("Divide...", "value=255 stack");
	rename("Threshold_Control_coloc");
	close("Bin");
	close("Log");
	imageCalculator("AND create stack", "Global coloc","Threshold_Control_coloc");
	selectWindow("Result of Global coloc");
	rename("Control coloc");
	}
}	
function Indiv_Co() { 
run("Set 3D Measurements", "volume surface nb_of_obj._voxels nb_of_surf._voxels integrated_density mean_gray_value std_dev_gray_value median_gray_value minimum_gray_value maximum_gray_value centroid mean_distance_to_surface std_dev_distance_to_surface median_distance_to_surface centre_of_mass bounding_box dots_size=5 font_size=10 white_numbers store_results_within_a_table_named_after_the_image_(macro_friendly) redirect_to=none");
selectWindow("Global coloc");
getPixelSize(unit, pw, ph, pd);	
		//values : unit to obj. voxel 
		minobjCo=minCo/(ph*pw*pd);
		minobjCo_integer=Math.round(minobjCo);	
		maxobjCo=maxCo/(ph*pw*pd);
		maxobjCo_integer=Math.round(maxobjCo);	
		
if(controlcoloc=="No"){		
selectWindow("Global coloc");
run("3D object counter...", "threshold=1 min.=1 objects statistics");
run("glasbey on dark");
Table_globalcoloc();
Table_controlcoloc_empty();
selectWindow("Objects map of Global coloc");
rename("MGV_Globalcoloc");
selectWindow("Global coloc");
run("Divide...", "value=255 stack");
}
if(controlcoloc=="Yes"){
	CheckObj_ControlCo= File.openAsString(pathway_save + "Check_ControlCo.txt");
	if (indexOf(CheckObj_ControlCo, "Nb obj in range size =0") > -1 && lengthOf(CheckObj_ControlCo) < 42){	
	selectWindow("Global coloc");
	getPixelSize(unit, pw, ph, pd);	
		//values : unit to obj. voxel 
		minobjCo=minCo/(ph*pw*pd);
		minobjCo_integer=Math.round(minobjCo);	
	run("3D object counter...", "threshold=1 min.="+minobjCo_integer+" objects statistics");
	run("glasbey on dark");
	Table_globalcoloc();	
	selectWindow("Control coloc");
	run("3D object counter...", "threshold=1 min.="+minobjCo_integer+" objects statistics");
	run("glasbey on dark");
	Table_Check_Control_Coloc();
	selectWindow("Objects map of Global coloc");
	rename("MGV_Globalcoloc");
		//Thresholding-Control-coloc
	selectWindow("Objects map of Control coloc");
	rename("MGV_Controlcoloc");
	selectWindow("Control coloc");
	run("Divide...", "value=2 stack");
		}
	else {
	selectWindow("Global coloc");
	getPixelSize(unit, pw, ph, pd);	
		//values : unit to obj. voxel 
		minobjCo=minCo/(ph*pw*pd);
		minobjCo_integer=Math.round(minobjCo);	
	run("3D object counter...", "threshold=1 min.="+minobjCo_integer+" objects statistics");
	run("glasbey on dark");
	Table_globalcoloc();		
	selectWindow("Control coloc");
	run("3D object counter...", "threshold=1 min.="+minobjCo_integer+" objects statistics");
	run("glasbey on dark");
	Table_controlcoloc();

	selectWindow("Objects map of Global coloc");
	rename("MGV_Globalcoloc");
		//Thresholding-Control-coloc
	selectWindow("Objects map of Control coloc");
	rename("MGV_Controlcoloc");
	selectWindow("Control coloc");
	run("Divide...", "value=2 stack");
		}
	}
}

function Table_controlcoloc() {	
selectWindow("Statistics for Control coloc");
volumeCo=Table.getColumn("Volume ("+X+"^3)");
surfaceCo=Table.getColumn("Surface ("+X+"^2)");
ObjvoxCo=Table.getColumn("Nb of obj. voxels");
SurfvoxCo=Table.getColumn("Nb of surf. voxels");
intdenCo=Table.getColumn("IntDen");
meangvalueCo=Table.getColumn("Mean");
Table.create("Results");
	Table.setColumn("Volume ("+X+"^3)",volumeCo);
	Table.setColumn("Surface ("+X+"^2)",surfaceCo);
	Table.setColumn("Nb of obj. voxels",ObjvoxCo);	
	Table.setColumn("Nb of surf. voxels",SurfvoxCo);						
	run("Summarize");
Excel_ControlColoc();
Table.rename("Results", "Table_Statistics for Control coloc");
close("Statistics for Control coloc");
}

function Table_controlcoloc_empty() {	
emptyNaN=newArray("NaN");	
Table.create("Results");
	Table.setColumn("Volume ("+X+"^3)",emptyNaN);
	Table.setColumn("Surface ("+X+"^2)",emptyNaN);
	Table.setColumn("Nb of obj. voxels",emptyNaN);	
	Table.setColumn("Nb of surf. voxels",emptyNaN);						
	run("Summarize");
Excel_ControlColoc();
Table.rename("Results", "Table_Statistics for Control coloc");
}

function Table_globalcoloc() {	
selectWindow("Statistics for Global coloc");
volumeCo=Table.getColumn("Volume ("+X+"^3)");
surfaceCo=Table.getColumn("Surface ("+X+"^2)");
ObjvoxCo=Table.getColumn("Nb of obj. voxels");
SurfvoxCo=Table.getColumn("Nb of surf. voxels");
intdenCo=Table.getColumn("IntDen");
meangvalueCo=Table.getColumn("Mean");
Table.create("Results");
	Table.setColumn("Volume ("+X+"^3)",volumeCo);
	Table.setColumn("Surface ("+X+"^2)",surfaceCo);
	Table.setColumn("Nb of obj. voxels",ObjvoxCo);	
	Table.setColumn("Nb of surf. voxels",SurfvoxCo);						
	run("Summarize");
Excel_GlobalColoc();
Table.rename("Results", "Table_Statistics for Global coloc");
close("Statistics for Global coloc");
}	
	//Functions : "Coloc(s) per channel"
		//Function : Determining the total volume of coloc(s) per elements
function Indiv_CxCo_Vol() {
if(controlcoloc=="No"){
imageCalculator("Multiply create stack", "Objects map of C"+n,"Global coloc");
selectWindow("Result of Objects map of C"+n);
rename("Objects map of GlobalColoc x C"+n);
run("16-bit");
nZ=nSlices;
countsSum=newArray(65536);
values=Array.getSequence(65536);
for(i=1; i<=nZ;i++){
selectWindow("Objects map of GlobalColoc x C"+n);
setSlice(i);
getHistogram(values, counts, 65536);
for(j=0; j<counts.length; j++){
countsSum[j]+=counts[j];
		}
	}
Table.create("Table_Histogram of GlobalColoc x C"+n);
		Table.setColumn("Identified elements", values);
		Table.setColumn("Nbs_of_voxels_coloc_with_C"+n, countsSum);
		Table.applyMacro("Volume=Nbs_of_voxels_coloc_with_C"+n+"*"+width+"*"+height+"*"+depth);
		Table.deleteRows(0, 0, "Table_Histogram of GlobalColoc x C"+n);	
}
if(controlcoloc=="Yes"){
	//for global coloc (gc)
imageCalculator("Multiply create stack", "Objects map of C"+n,"Global coloc");
selectWindow("Result of Objects map of C"+n);
rename("Objects map of GlobalColoc x C"+n);
run("16-bit");
nZ=nSlices;
countsSum=newArray(65536);
values=Array.getSequence(65536);
for(i=1; i<=nZ;i++){
selectWindow("Objects map of GlobalColoc x C"+n);
setSlice(i);
getHistogram(values, counts, 65536);
for(j=0; j<counts.length; j++){
countsSum[j]+=counts[j];
		}
	}
Table.create("Table_Histogram of GlobalColoc x C"+n);
		Table.setColumn("Identified elements", values);
		Table.setColumn("Nbs_of_voxels_coloc_with_C"+n, countsSum);
		Table.applyMacro("Volume=Nbs_of_voxels_coloc_with_C"+n+"*"+width+"*"+height+"*"+depth);
		Table.deleteRows(0, 0, "Table_Histogram of GlobalColoc x C"+n);	
	
	//for control coloc (cc)
imageCalculator("Multiply create stack", "Objects map of C"+n,"Control coloc");
selectWindow("Result of Objects map of C"+n);
rename("Objects map of ControlColoc x C"+n);
run("16-bit");
nZ=nSlices;
countsSum=newArray(65536);
values=Array.getSequence(65536);
for(i=1; i<=nZ;i++){
selectWindow("Objects map of ControlColoc x C"+n);
setSlice(i);
getHistogram(values, counts, 65536);
for(j=0; j<counts.length; j++){
countsSum[j]+=counts[j];
		}
	}
Table.create("Table_Histogram of ControlColoc x C"+n);
		Table.setColumn("Identified elements", values);
		Table.setColumn("Nbs_of_voxels_coloc_with_C"+n, countsSum);
		Table.applyMacro("Volume=Nbs_of_voxels_coloc_with_C"+n+"*"+width+"*"+height+"*"+depth);
		Table.deleteRows(0, 0, "Table_Histogram of ControlColoc x C"+n);
		
}
}
		//Function : Determining the number of coloc(s) per element
function Indiv_CxCo_Nb() {
if(controlcoloc=="No"){	
run("Set 3D Measurements", "mean_gray_value dots_size=5 font_size=10 white_numbers store_results_within_a_table_named_after_the_image_(macro_friendly) redirect_to=none");	
selectWindow("Objects map of GlobalColoc x C"+n);
run("3D object counter...", "threshold=1 min.=1 objects statistics");
selectWindow("Objects map of Objects map of GlobalColoc x C"+n);
rename("GlobalColoc on elements of C"+n);
Table.rename("Statistics for Objects map of GlobalColoc x C"+n, "Results");
Table.rename("Results", "Table_GlobalColoc on elements of C"+n);
run("glasbey on dark");			
}
if(controlcoloc=="Yes"){	
		//for global coloc (gc)
run("Set 3D Measurements", "mean_gray_value dots_size=5 font_size=10 white_numbers store_results_within_a_table_named_after_the_image_(macro_friendly) redirect_to=none");	
selectWindow("Objects map of GlobalColoc x C"+n);
run("3D object counter...", "threshold=1 min.=1 objects statistics");
selectWindow("Objects map of Objects map of GlobalColoc x C"+n);
rename("GlobalColoc on elements of C"+n);
Table.rename("Statistics for Objects map of GlobalColoc x C"+n, "Results");
Table.rename("Results", "Table_GlobalColoc on elements of C"+n);
run("glasbey on dark");		
	//for control coloc (cc)
run("Set 3D Measurements", "mean_gray_value dots_size=5 font_size=10 white_numbers store_results_within_a_table_named_after_the_image_(macro_friendly) redirect_to=none");	
selectWindow("Objects map of ControlColoc x C"+n);
run("3D object counter...", "threshold=1 min.=1 objects statistics");
selectWindow("Objects map of Objects map of ControlColoc x C"+n);
rename("ControlColoc on elements of C"+n);
Table.rename("Statistics for Objects map of ControlColoc x C"+n, "Results");
Table.rename("Results", "Table_ControlColoc on elements of C"+n);
run("glasbey on dark");		
}
}

		//Function : Getting the mean gray value (MGV) of coloc(s) area in each channel
function Create_MGV_GlobalCo(){
run("3D Intensity Measure", "objects=MGV_Globalcoloc signal=C"+n+"");
selectWindow("Results");
run("Summarize");
selectWindow("Results");
	mgvinglobalcoloc=Table.getColumn("IntensityAvg");
	label_mgvinglobalcoloc=Table.getColumn("Label");
	empty=newArray("", "");
	Table.rename("Results", "Table_MeanGrayValue_GlobalColoc on C"+n);
close("Objects map of Result of Global coloc"); 
close("Result of Objects map of Global coloc"); 
close("Objects map of Result of Objects map of Global coloc");
close("Result of Global coloc");  
}	
function Create_MGV_ControlCo(){
run("3D Intensity Measure", "objects=MGV_Controlcoloc signal=C"+n+"");
selectWindow("Results");
run("Summarize");
selectWindow("Results");
	mgvincontrolcoloc=Table.getColumn("IntensityAvg");
	label_mgvincontrolcoloc=Table.getColumn("Label");
	empty=newArray("", "");
	Table.rename("Results", "Table_MeanGrayValue_ControlColoc on C"+n);
}	

		//Function : Displaying number + volume(s) of coloc(s) for each element of each channel & MGV of coloc area in each channel
function CxCo_NbxVol() {
empty=newArray("", "");
emptyNaN=newArray("NaN");	
histogc=newArray(65536);
cellgc=newArray(65536);
histocc=newArray(65536);
cellcc=newArray(65536);

if(controlcoloc=="No"){	
	//for global coloc (gc)
	selectWindow("Table_GlobalColoc on elements of C"+n);
		nbCoCgc=Table.getColumn("Mean");
	selectWindow("Table_Histogram of GlobalColoc x C"+n);
		volumeCoCgc=Table.getColumn("Volume");		
	Array.getStatistics(nbCoCgc, min, max, mean, stdDev);
	print(max);
	for (i = 0; i < max; i++) {
		cellgc[i]=i+1;}
	for (i = 0; i <nbCoCgc.length; i++) {
		valeurCourante=nbCoCgc[i];
		histogc[valeurCourante-1]=histogc[valeurCourante-1]+1;}
	Array.print(histogc);
	
	Create_MGV_GlobalCo();
	selectWindow("Table_MeanGrayValue_GlobalColoc on C"+n);
	mgvinglobalcoloc=Table.getColumn("IntensityAvg");
	label_mgvinglobalcoloc=Table.getColumn("Label");

	//Tables recap
		//for global coloc
	Table.create("Nbs of Globalcoloc on elements of C"+n);
	Table.setColumn("C"+n+" elements", cellgc);
	Table.setColumn("Nbs of Globalcoloc on C"+n, histogc);
	Table.setColumn("Total volume of Globalcoloc "+X+"^3", volumeCoCgc);
	Table.setColumn("", empty);
	Table.setColumn("Label Global_Coloc", label_mgvinglobalcoloc);
	Table.setColumn("Mean Gray value Globalcoloc area on C"+n, mgvinglobalcoloc);
	selectWindow("Nbs of Globalcoloc on elements of C"+n);
	Table.rename("Nbs of Globalcoloc on elements of C"+n, "Results");
	Excel_CxGlobalCo();
	Table.rename("Results", "Table_Nbs of Globalcoloc on elements of C"+n);
		//for control coloc
	Table.create("Nbs of Controlcoloc on elements of C"+n);
	Table.setColumn("C"+n+" elements", emptyNaN);
	Table.setColumn("Nbs of Controlcoloc on C"+n, emptyNaN);
	Table.setColumn("Total volume of Controlcoloc "+X+"^3", emptyNaN);
	Table.setColumn("", empty);
	Table.setColumn("Label Control_Coloc", emptyNaN);
	Table.setColumn("Mean Gray value Controlcoloc area on C"+n, emptyNaN);	
	selectWindow("Nbs of Controlcoloc on elements of C"+n);
	Table.rename("Nbs of Controlcoloc on elements of C"+n, "Results");
	Excel_CxControlCo();
	Table.rename("Results", "Table_Nbs of Controlcoloc on elements of C"+n);
	
	close("Log");
	close("Objects map of GlobalColoc x C"+n);

}
if(controlcoloc=="Yes"){	
	//for global coloc (gc)
	selectWindow("Table_GlobalColoc on elements of C"+n);
		nbCoCgc=Table.getColumn("Mean");
	selectWindow("Table_Histogram of GlobalColoc x C"+n);
		volumeCoCgc=Table.getColumn("Volume");		
	Array.getStatistics(nbCoCgc, min, max, mean, stdDev);
	print(max);
	for (i = 0; i < max; i++) {
		cellgc[i]=i+1;}
	for (i = 0; i <nbCoCgc.length; i++) {
		valeurCourante=nbCoCgc[i];
		histogc[valeurCourante-1]=histogc[valeurCourante-1]+1;}
	Array.print(histogc);	
	//for control coloc (cc)
	selectWindow("Table_ControlColoc on elements of C"+n);
		nbCoCcc=Table.getColumn("Mean");
	selectWindow("Table_Histogram of ControlColoc x C"+n);
		volumeCoCcc=Table.getColumn("Volume");		
	Array.getStatistics(nbCoCcc, min, max, mean, stdDev);
	print(max);
	for (i = 0; i < max; i++) {
		cellgc[i]=i+1;}
	for (i = 0; i <nbCoCcc.length; i++) {
		valeurCourante=nbCoCcc[i];
		histocc[valeurCourante-1]=histocc[valeurCourante-1]+1;}
	Array.print(histocc);	
	
	Create_MGV_GlobalCo();
	selectWindow("Table_MeanGrayValue_GlobalColoc on C"+n);
	mgvinglobalcoloc=Table.getColumn("IntensityAvg");
	label_mgvinglobalcoloc=Table.getColumn("Label");
	
	CheckObj_ControlCo= File.openAsString(pathway_save + "Check_ControlCo.txt");
	if (indexOf(CheckObj_ControlCo, "Nb obj in range size =0") > -1 && lengthOf(CheckObj_ControlCo) < 42){	
	Table_Check_Control_Coloc_MGV();
	selectWindow("Table_MeanGrayValue_ControlColoc on C"+n);
	mgvincontrolcoloc=Table.getColumn("IntensityAvg");
	label_mgvincontrolcoloc=Table.getColumn("Label");
	}
	else {
	Create_MGV_ControlCo();
	selectWindow("Table_MeanGrayValue_ControlColoc on C"+n);
	mgvincontrolcoloc=Table.getColumn("IntensityAvg");
	label_mgvincontrolcoloc=Table.getColumn("Label");	
	}
	
	//Tables recap
		//for global coloc
	Table.create("Nbs of Globalcoloc on elements of C"+n);
	Table.setColumn("C"+n+" elements", cellgc);
	Table.setColumn("Nbs of Globalcoloc on C"+n, histogc);
	Table.setColumn("Total volume of Globalcoloc "+X+"^3", volumeCoCgc);
	Table.setColumn("", empty);
	Table.setColumn("Label Global_Coloc", label_mgvinglobalcoloc);
	Table.setColumn("Mean Gray value Globalcoloc area on C"+n, mgvinglobalcoloc);	
	selectWindow("Nbs of Globalcoloc on elements of C"+n);
	Table.rename("Nbs of Globalcoloc on elements of C"+n, "Results");
	Excel_CxGlobalCo();
	Table.rename("Results", "Table_Nbs of Globalcoloc on elements of C"+n);
		//for control coloc
	Table.create("Nbs of Controlcoloc on elements of C"+n);
	Table.setColumn("C"+n+" elements", cellcc);
	Table.setColumn("Nbs of Controlcoloc on C"+n, histocc);
	Table.setColumn("Total volume of Controlcoloc "+X+"^3", volumeCoCcc);
	Table.setColumn("", empty);
	Table.setColumn("Label Control_Coloc", label_mgvincontrolcoloc);
	Table.setColumn("Mean Gray value Controlcoloc area on C"+n, mgvincontrolcoloc);
	selectWindow("Nbs of Controlcoloc on elements of C"+n);
	Table.rename("Nbs of Controlcoloc on elements of C"+n, "Results");
	Excel_CxControlCo();
	Table.rename("Results", "Table_Nbs of Controlcoloc on elements of C"+n);
	
	close("Log");
	close("Objects map of GlobalColoc x C"+n);
	close("Objects map of ControlColoc x C"+n);
}
}
	//Function : Close all tables
function CloseTables() {
listwindow = getList("window.titles");
for(i = 0;i<listwindow.length;i++){
	if(matches(listwindow[i],".*Table_.*")){
		selectWindow(listwindow[i]);
		run("Close");
		}
 	  }
//close("Global coloc"); 
}
}


macro "Test settings Action Tool - N66C111CfffDbbC999D2cDa7C280DceDdeDedCdedC444D1bD1cD1dD7cD8bD94D99CcccD7aD9eDa9Db0De0C777D54CefeD9dC333D2aD46D53Cac9C666D7bD89CeeeD9bC555D45D4aCdddD37C888D2dD57D8dDa4CfffD0bD0cD0dD38D6bD6cD6dD72D79Da0Db4Db9De4De9C333D3eD49D63D84D8eDc1Dc7Dd1Dd7CbbbD34D3bD43D85C593CeeeD3dD52D56D5aD62D75D83D97Dc2Dc8Dd2Dd8C444D74D7dD98Db7De7CcdbDdcDebC888D4eD73Da2Db8De8CffeDccCbbbD59Db3Dc0Dd0De3C7a5CeeeD29D4bD55D5eDb6De6C555Da3Db2De2CdddD88D95C999D8cC222D2eD44D47CaaaD39D7eD93C280DbdCeedC777D1eD36CacaC666D2bD35D48D58CefeD9cDabC6a5DeeCcccDc6Dd6C7b6C8b7DbcC222D3aD8aDa8Db1De1CaaaD1aD64D9aDa1C6a4C492CbdaDaeC6a5DcdC6a4DacDadC381DbeC492DddDecBf0C111CfffD49D4aC999D07D8cC280D0cD1bD2aCdedC444D14D2eD9bD9cD9dCcccD2dC777D54CefeD28D38C333D53D66D8aCac9C666CeeeC555D65D6aCdddD09D15D77C888D04D18D57D8dCfffD00D32D78DabDacDadC333D24D43D69D7eCbbbD13D25D63D74D7bC593D29CeeeD1eD23D35D42D52D56D5aD7dC444D34CcdbD0aC888D02D33D6eCffeCbbbD3eD59C7a5D39CeeeD17D55D5eD6bD89C555D03CdddD3dC999C222D64D67D8eCaaaD79C280CeedD0eD1dC777D76D9eCacaD19C666D58D68D75D8bCefeD2cD3bC6a5D0dD2bCcccC7b6D3aC8b7C222D08D7aCaaaD01D44D9aC6a4C492D1aCbdaC6a5D1cC6a4C381C492D0bB0fC111D60CfffC999D73C280CdedC444CcccD05D12C777D01D10D16D52D70CefeC333D07D61Cac9C666D15CeeeC555D20D36CdddD45D50C888CfffD03D14D54D67D72D76D90C333D06D25D46D63CbbbD09D21D26D57C593CeeeD37C444CcdbC888D35D66CffeCbbbC7a5CeeeD00D24D30C555D64CdddD17D71C999D75C222D11D65CaaaD47D55C280CeedC777D08D51CacaC666D02D62D74CefeC6a5CcccD53D80C7b6C8b7C222D56CaaaC6a4C492CbdaC6a5C6a4C381C492Nf0C111D40CfffC999D33C280CdedDd1C444CcccD92Da5Db3De3C777D30D52Da1CefeC333D41Da7Db2De2Cac9Db0C666D90CeeeC555D76Db8Dc2Dd2De8CdddD50D65Dc8DcaDd8DdaDe1C888CfffD10D32D36D47D54D94Da3C333D43D66D85Da6Db9Dc9Dd9De9CbbbD57D81D86Da9Db7De7C593CeeeD77C444D80CcdbDc1C888D46D75Dc3Dd3CffeCbbbC7a5CeeeD70D84Da0C555D44CdddD31D97Db6DbaDe6DeaC999D35C222D45D91CaaaD55D67C280CeedC777D51Da8CacaC666D34D42D95D96Da2CefeDe0C6a5CcccD20D53Db1C7b6C8b7C222D56CaaaC6a4Dd0C492CbdaC6a5C6a4C381Dc0C492"{

//Script
run("Set 3D Measurements", "volume surface nb_of_obj._voxels nb_of_surf._voxels integrated_density mean_gray_value std_dev_gray_value median_gray_value minimum_gray_value maximum_gray_value centroid mean_distance_to_surface std_dev_distance_to_surface median_distance_to_surface centre_of_mass bounding_box dots_size=5 font_size=10 white_numbers store_results_within_a_table_named_after_the_image_(macro_friendly) redirect_to=none");	
GUI1_test();
	version="Bioloc3D 2.0.1";
	myStack= Dialog.getString();	
	pathway_test=Dialog.getString();
	cond_test= Dialog.getNumber();
	channel= Dialog.getRadioButton();	
	test= Dialog.getRadioButton();

open(myStack);	
Stack.getUnits(X, Y, Z, Time, Value);
Stack.getDimensions(width, height, channels, slices, frames);
name=getTitle();

if (channel=="C1") {
Split_and_SelectC1();	
}

if (channel=="C2") {
Split_and_SelectC2();	
}

if (channel=="C3") {
Split_and_SelectC3();	
}

if (channel=="C4") {
Split_and_SelectC4();	
}
if (test=="Extract (quicker)"){
Middle_stack();
}
else {
Full_stack();
}
GUI2_test(); 
GUI3_test(); 
	tC_test= Dialog.getNumber();
	minC_test= Dialog.getNumber();
	maxC_test= Dialog.getNumber();
	minSoma_test= Dialog.getNumber();

if (minSoma_test==0) {
Test_Counting_C();		
}
else {
Test_Counting_C();
Test_Counting_Soma();	
}

Parameters_Test();
CloseTables_test();
run("Tile");

//Functions
	//User interfaces
function GUI1_test() {
Dialog.create("Bioloc3D: Settings test");
	Dialog.setInsets(0,0,0);
Dialog.addMessage("# Step 1/4 : Load and save ", 13, "#000000");
	Dialog.setInsets(12,0,0);
Dialog.addMessage("Stack to analyze:");
Dialog.addFile("", "");
	Dialog.setInsets(5,0,0);
Dialog.addMessage("Pathway to save data file:");
Dialog.addDirectory("", "");
	Dialog.setInsets(12,0,0);
Dialog.addMessage("Excel name (e.g. Test_1) :");
	Dialog.setInsets(5,0,0);
Dialog.addNumber("Condition number",1,0,2,"");
channel_choice = newArray("C1","C2","C3","C4");
	Dialog.setInsets(0,0,0);
Dialog.addRadioButtonGroup("Which channel (C) do you want to test?", channel_choice, 1, 1, "C1");	
test_choice = newArray("Full (more precise)   ","Extract (quicker)");
	Dialog.setInsets(0,0,0);
Dialog.addRadioButtonGroup("Would like to perform the test on full stack or extract ? ", test_choice, 1, 1, "Extract (quicker)");
	Dialog.setInsets(7,0,0);
Dialog.addMessage("Note :", 11.5, "#000000");
	Dialog.setInsets(2,20,0);
Dialog.addMessage("- Choosing full stack will take more time", 11.5, "#000000");
	Dialog.setInsets(5,20,0);
Dialog.addMessage("- Choosing extract will sample 5 slices in the middle of your stack", 11.5, "#000000");
Dialog.show();
}
	
function GUI2_test() {
selectWindow("Test_C");	
setAutoThreshold("Default dark");
run("Threshold...");
waitForUser("Bioloc3D: Settings test", "# Step 2/4: Threshold for C \n \nFind the right threshold & click OK. \nDo NOT apply, you will enter threshold value later");
close("Threshold...");
}

function GUI3_test() {
Dialog.create("Bioloc3D: Settings test");
	Dialog.setInsets(0, 0, 0);
Dialog.addMessage("# Step 3/4 : Counting fluo. profiles ", 13, "#000000");
	Dialog.setInsets(12,0,0);
Dialog.addMessage("Channel (C) settings:", 12, "#000000");
Dialog.addSlider("Threshold", 0, 255, 0);
Dialog.addNumber("Min. C",0,0,7,"(microns^3)");
Dialog.addNumber("Max. C",0,0,7,"(microns^3)");
	Dialog.setInsets(20,0,0);
Dialog.addMessage("# Step 4/4 : Counting soma ", 13, "#000000");
	Dialog.setInsets(12,0,0);
Dialog.addMessage("Soma detection settings:", 12, "#000000");
	Dialog.setInsets(5,0,0);
Dialog.addNumber("Min. Soma",0,0,7,"(microns^2)");
	Dialog.setInsets(3, 0, 0);
Dialog.addMessage("Note: If 0 in boxe above, step 4 skips", 11.5, "#000000");
Dialog.show();	
}
	//Analysis functions
function Split_and_SelectC1() { 
run("Split Channels");	
if(channels >2 && channels >3){
close("C2-"+name);
close("C3-"+name);
close("C4-"+name);
}
if(channels >2 && channels < 4){
close("C2-"+name);
close("C3-"+name);
}
else {
}
selectWindow("C1-"+name);
rename("Test_C");
}

function Split_and_SelectC2() {
run("Split Channels");	
if(channels >2 && channels >3){
close("C1-"+name);
close("C3-"+name);
close("C4-"+name);
}
if(channels >2 && channels < 4){
close("C1-"+name);
close("C3-"+name);
}
else {
}
selectWindow("C2-"+name);
rename("Test_C");
}

function Split_and_SelectC3() { 
run("Split Channels");	
if(channels >2 && channels >3){
close("C1-"+name);
close("C2-"+name);
close("C4-"+name);
}
if(channels >2 && channels < 4){
close("C1-"+name);
close("C2-"+name);
}
else {
}
selectWindow("C3-"+name);
rename("Test_C");
}

function Split_and_SelectC4() { 
run("Split Channels");	
if(channels >2 && channels >3){
close("C1-"+name);
close("C2-"+name);
close("C3-"+name);
}
if(channels >2 && channels < 4){
close("C1-"+name);
close("C2-"+name);
}
else {
}
selectWindow("C4-"+name);
rename("Test_C");
}

function Middle_stack() { 
Stack.getDimensions(width, height, channels, slices, frames);
half=slices/2;
half_integer=Math.round(half);
half_minus_2=half_integer-2;
half_plus_2=half_integer+2;
selectWindow("Test_C");
rename("Test_Soma");
run("Duplicate...", "duplicate range="+half_minus_2+"-"+half_plus_2+"");
rename("Test_C");
}

function Full_stack() { 
selectWindow("Test_C");
rename("Test_Soma");
run("Duplicate...", "title=[Test_C] duplicate");
}

function Additional_C() { 
	if (controlcoloc=="Yes" && addDetection=="Yes") {
	selectWindow("C3");
	rename("Control_coloc");
	selectWindow("C4");
	rename("Control_soma");
	}
	if (controlcoloc=="No" && addDetection=="Yes") {
	selectWindow("C3");
	rename("Control_soma"); 
	}
	if (controlcoloc=="Yes" && addDetection=="No") {
	selectWindow("C3");
	rename("Control_coloc");
	}
	else {
	}
}

function Test_Counting_C() { 
selectWindow("Test_C");		
	getPixelSize(unit, pw, ph, pd);		 
		//values : unit to obj. voxel 
		minobjC_test=minC_test/(ph*pw*pd);
		minobjC_test_integer=Math.round(minobjC_test);	
		maxobjC_test=maxC_test/(ph*pw*pd);
		maxobjC_test_integer=Math.round(maxobjC_test);	
run("3D object counter...", "threshold="+tC_test+" min.="+minobjC_test_integer+" max.="+maxobjC_test_integer+" objects statistics");
run("glasbey on dark");
Table_C_test();
}
function Table_C_test() {	
selectWindow("Statistics for Test_C");
volumeC_test=Table.getColumn("Volume ("+X+"^3)");
surfaceC_test=Table.getColumn("Surface ("+X+"^2)");
ObjvoxC_test=Table.getColumn("Nb of obj. voxels");
SurfvoxC_test=Table.getColumn("Nb of surf. voxels");
intden_test=Table.getColumn("IntDen");
meangvalueC_test=Table.getColumn("Mean");
close("Statistics for Test_C");
Table.create("Results");
	Table.setColumn("Volume ("+X+"^3)",volumeC_test);
	Table.setColumn("Surface ("+X+"^2)",surfaceC_test);
	Table.setColumn("Nb of obj. voxels",ObjvoxC_test);	
	Table.setColumn("Nb of surf. voxels",SurfvoxC_test);
	Table.setColumn("IntDen",intden_test);
	Table.setColumn("Mean",meangvalueC_test);							
	run("Summarize");
run("Read and Write Excel", "dataset_label=[Objects map of C] file=["+pathway_test+"Test_"+cond_test+".xlsx] sheet=Object_Map_C");		
Table.rename("Results", "Table_C_Test");
}
function Test_Counting_Soma() { 
selectWindow("Test_Soma");
run("Z Project...", "projection=[Max Intensity]");
setThreshold(tC_test, 65535);
	setOption("BlackBackground", false);
	run("Convert to Mask", "method=Default background=Dark");
run("Directional Filtering", "type=Max operation=Erosion line=20 direction=25");
rename("Test_Soma_Counting");
run("Fill Holes");
run("Watershed");
run("Analyze Particles...", "size="+minSoma_test+"-Infinity show=[Overlay Masks] display clear summarize composite");
Table.rename("Summary", "Results_Test_Soma");	
Table_Soma_test();	
}
function Table_Soma_test() {	
selectWindow("Results_Test_Soma");
countsoma_test=Table.getColumn("Count");
totalarea_test=Table.getColumn("Total Area");
meanarea_test=Table.getColumn("Average Size");	
close("Results_Test_Soma");						
Table.create("Table_Test_Soma");
	Table.setColumn("Nb of soma", countsoma_test);
	Table.setColumn("Total area "+X+"^2", totalarea_test);
	Table.setColumn("Mean area "+X+"^2", meanarea_test);
	Table.rename("Table_Test_Soma", "Results");
	run("Read and Write Excel", "dataset_label=[Objects map of Soma] file=["+pathway_test+"Test_"+cond_test+".xlsx] sheet=Object_Map_C");		
Table.rename("Results", "Table_Test_Soma");
close("Log");
}

function Parameters_Test() { 
value_threshold_test= newArray(tC_test,tC_test);
value_min_test= newArray(minC_test,minSoma_test);
value_max_test= newArray(maxC_test);
value_label_test= newArray("C","Soma");
value_version_test= newArray(version);
Table.create("Analysis parameters");
	Table.setColumn("Label", value_label_test);
	Table.setColumn("Threshold", value_threshold_test);
	Table.setColumn("Min.", value_min_test);
	Table.setColumn("Max.", value_max_test);
	Table.setColumn("Macro version", value_version_test);
Table.rename("Analysis parameters", "Results");
run("Read and Write Excel", "dataset_label=[Test parameters _ "+myStack+"] file=["+pathway_test+"Test_"+cond_test+".xlsx] sheet=Parameters");		
Table.rename("Results", "Table_Parameters_Test");			
}

function CloseTables_test() {
listwindow_test = getList("window.titles");
for(i = 0;i<listwindow_test.length;i++){
	if(matches(listwindow_test[i],".*Table_.*")){
		selectWindow(listwindow_test[i]);
		run("Close");
		}
 	  }
close("Test_Soma"); 
close("MAX_Test_Soma"); 
	}

}

macro "Help Action Tool - N66C000DcaDdaC000DbaC000D9bC000Dc9Dd9C000D8bC000D48C111D49C111Db9C111D84D94Da4DabDb4Dc4Dd4De4C111C222D6bD7bD9cDbbDcbDdbC222D74C222D9dC222D9eC333D56C333C444D47C444DaaDeaC444De9C444C555D66C555D5bC555D8cC555D8dC555C666DebC666D6aD7aD8aD9aC666D8eC666D85D95Da5Db5Dc5Dd5De5C666D75C666D5aC777C888D65C888D38C888D39C888C999D4aC999CaaaD57CaaaD37CaaaD55CaaaCbbbDa9CbbbDc8Dd8CbbbDb8CcccD64CcccD59CcccD58CcccDacCcccDe8CdddD3aCdddD67CdddDaeCdddD83D93Da3Db3Dc3Dd3De3CdddD73CdddD7cCeeeD6cDbcDccDdcCeeeD46CeeeDadCeeeD5cCeeeDecCeeeDa8CeeeCfffD4bDbeDceDdeDeeCfffD63CfffD76CfffD36D45CfffD7dD7eCfffD4cD69D77D79D89D99CfffD86D96Da6Db6Dc6Dd6De6Bf0C000D2eC000D1eC000C111D46C111D04D14D24C111C222D4cD68D69D6aC222C333C444D6bC444C555D3eC555D67C555D58D59D5aC555D34C555C666D5bC666D05D15D25C666D57C666D4dC666C777D35C777C888D3dC888D0eC888C999D1dD2dD45C999D5cC999D56C999CaaaCbbbD36CbbbD3cCcccD47CcccD5dCcccD0dCcccCdddD55CdddD4bCdddD03D13D23CdddCeeeD78D79D7aCeeeD33D6cCeeeD7bCeeeD77CeeeD37CeeeCfffD66CfffD3bCfffD4eCfffD09D0aCfffD0bD44CfffD48D49D4aD7cCfffD08CfffD06D0cD16D26D43D76B0fC000D03D04C000C111D02C111C222D05C222C333C444C555C666C777C888D00C888C999CaaaD13D14CaaaD06D12CaaaD01CaaaCbbbD15CbbbCcccD10D20CcccCdddD30CdddCeeeD11CeeeCfffD07D16CfffD40CfffNf0C000Dc6Dd6C000Db6C111C222De6C222C333D93D94C333Da5Dc0Dd0C333Db0C333D92C333C444Dc1Dd1C444Db1C444De0C444Da3Da4C444Da2C444C555De1C555Da0Da6C555C666D95C666C777C888Da1De5C888C999Dc7Dd7C999Db7CaaaCbbbDe2CbbbD90CbbbDb5De3De4De7CbbbDc5Dd5CbbbCcccD91CcccCdddD80CdddCeeeD96Da7CeeeDb2CeeeCfffD82D83D84CfffD85CfffDc2Dd2CfffDb3Db4CfffD81CfffD70D86"{
exec("open", "https://github.com/tdhellemmes");

}