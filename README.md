<h1><img align="center" height="80" src="/B3D-Img/ressource/logo.ico">   B3D-Imaging <em>a.k.a</em> B3D-Img</h1>

## 📝 Description  
[B3D-Img ImageJ macro](https://github.com/Bioloc3D/B3D-Img/tree/main/B3D-Img) is one of the two components of the [Bioloc3D toolset](https://github.com/orgs/Bioloc3D/repositories), an advanced and user-friendly 3D fluorescence imaging analysis solution. This macro specializes in the precise quantification of colocalizations in 3D by identifying and analyzing fluorescent elements from different channels. Excel files resulting from the macro analysis can be analyzed through the <em>B3D-Plt application</em>. 

## 📌 Installation Guide  
1. Download and install the [Fiji/ImageJ(IJ) software](https://imagej.net/downloads)
2. Update ImageJ through "Help -> Update..."
3. Add/Replace 3D Object Counter (core plugin of B3D-Img macro) in ImageJ/Fiji
   - in Fiji, delete the pre-existing version of the 3D Objects Counter plugin
   - Download the latest version of the [3D Object Counter plugin](https://github.com/fabricecordelieres/IJ-Plugin_3D_object_counter)
4. Add additional plugins through "Help -> Update... -> Manage Update Sites"
   - Select the following plugin packages
      - 3D ImageJ Suite
      - Excel Functions
      - ResultsToExcel
      - IJPB-plugins
   - Click "Apply and Close"
   - Click "Apply Changes"
5. Download and install the B3D-Img macro (.ijm)
   - Drag and drop the macro in toolset folder of ImageJ/Fiji file
5. Restart ImageJ/Fiji

## ⚡️ Operating instructions  

1. Open B3D-Imaging toolset through the "More Tools" menu in IJ toolbar


<img align="center" src="/B3D-Img/ressource/IJ_toolbar.png">


2. Define the parameters of your analysis for each channel via the "Parameters tool"
   - Select the stack and the channel to test, and the directory to save your test analysis
   - Define the adapted threshold of signal detection
   - Enter the desired parameters for detection of individualized elements, and soma (optional)


<img align="center" src="/B3D-Img/ressource/Parameters_tool.png">


3. Launch 3D quantification through the "Analysis tool"
   - Section 1: Load and save 
      - Select the directory to load stacks to analyze and data to save
      - IMPORTANT: Folder must contain only .tiff files
   - Section 2: Display results 
      - Select window displaying option (useful for proofreading, but advised)
      - IMPORTANT: Select "No" only if you run the analysis on 1 stack
   - Section 3: Discriminate elements  
      - Define parameters for the individualization of fluorescent profiles for each primary channel
         - Simple segmentation option: if "Yes", only counting of profiles will be performed without any additional data (e.g., volume, MGV)
      - Choose the additional features to run
         - Colocalization: define parameters of counting to verify colocalization of the two primary channels with a third one
         - Soma: define size of soma to count and threshold of an additional channel presenting ubiquitary staining (e.g., DAPI)


<img align="center" src="/B3D-Img/ressource/Analysis_tool.png">


4. Outputs files resulting from the analysis
   - Excel files compile all the data resulting from the analysis
   - Text files are here to avoid a crash of the macro if no objects are counted
      - "Parameters.txt" recaps all the different parameters used for your analysis (also available in each Excel file)

     
<img align="center" src="/B3D-Img/ressource/Analysis_outputs.png">


## 🚀 Contributing
Feel free to fork the repository and submit a pull request if you'd like to contribute.

## 📧 Contact
For any questions or issues, please open an issue on GitHub.
