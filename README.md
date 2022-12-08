# Web_File_Mgr_hw
## Objective
Develop a web app to locate and manage project files stored in the cloud.
## Context
At Machina Labs we manufacture parts based on CAD designs created by our customers. They "contract" us to build one or more parts based on their designs, and we manufacture each part in the contract as a separate "job". The entire manufacturing process may roughly be divided into three stages - Path-Planning, Building and Validation.

For "path planning", the 'CAD file' provided by our customer is converted into a 'build file' through a multi-step software process involving use of various commercial applications as well as internally developed apps and scripts. Typically, the customer's CAD design is modified or "prepped" for manufacturing (not always necessary), then "sliced" into multiple layers, followed by converting it into a 'build-file' containing instructions for our robots (path to follow). These files form a chain of linked files.

Build files are used to complete jobs, i.e. build corresponding parts, during manufacturing "runs". One or more runs may be necessary to successfully build a part. Occasionally, the customer CAD, or another file down the line, may need to be reprocessed with different parameters. All following files will also be reprocessed to create a new version of build file, thus creating branches of files. Each branch of files is identified as a unique configuration, usually called a "Test", and all file branches are retained in the cloud. After a successful "test run" results in a manufactured part, a post-build step involves "scanning" the  part to verify quality. The scanning process generates two raw files, which are processed to generate a 'scan mesh'. Other software is used to compare the mesh with desired geometry to generate multiple quality metrics - 'zmetric' and 'proximity' metric. All these data (files) are stored in the cloud and reused later - all file branches for ML training, and successful branches for production runs.

A SQL database containing information about how the files are linked to one another, related to customer contracts, jobs and runs performed, along with scan data and results is also maintained in the cloud. Occasionally, we need to retrieve or review/inspect individual files and corresponding run results - hence the web app.

For this assignment, the types of files involved are - Customer CAD, Prepped CAD, Slice file, Build file, Raw scan files (scannerXX.log and rsiXX.log), Scan results (scan_mesh.ply and point_cloud.xyz) and finally Scan metric files (zmetric.json and proximity.json).
## Web Interface
The web app is intended for previewing files and/or downloading them. So create a UI that can help users fulfill this function. Feel free to design and implement a GUI that is most user-friendly and functional.

Suggestion: The app UI may be designed like a file navigator that includes a file viewer...
- A panel containing a tree-view listing all customers.
- A list-view panel to display all files corresponding to selected tree level.
- Multiple selectors to filter files displyed in the list.
	* Allow filtering of files by customers, jobs, run configurations (tests) and runs.
- A panel to preview the selected file. 
- A button to download the selected file.
## Operation
The program will operate and be used as described below...
1. User navigates to the URL and opens app...
	- User is presented with the web page described above.
2. User navigates through the file tree to arrive at the desired files
	- List view panel displays files.
	- Multiple files of the selected type may be listed if no filter is applied.
3. User other controls to filters displayed files...
	- File list shrinks to reflect the filters applied.
4. Select a single file from the displayed file list...
	- This should also update the viewer panel.
	- Depending on the file type selected, the file viewer window may display contents of the file.
5. Clicking the 'download' button...
	- This will cause the selected file to be downloaded to user's computer.
## Inputs
To complete the above task, the following inputs are provided...
- A SQL script to create a Database - we prefer MySQL
- Set of files, representing stored project files, referenced in the database
## Requirements
- Create a web app providing the UI functionality described in the Web Interface section above.
- Ideally the solution will include a separate project providing a backend API service that interfaces with the database and provides files to the frontend through REST API calls. The files are intended to be stored in S3 or Blob storage, but for this assignment may be stored in the backend server's file system. Applicants interested in supporting full-stack roles, must implement separate frontend and service projects.
- Applicants only interested in the front-end role may avoid the service API project.
- The preview window must support displaying text based files - .csv, .log, .json
- The web app and database may be created using any framework/toolset the user is comfortable with.
- The deliverables must include documentation and all artifacts necessary to deploy and run the application. Docker containers may be most convenient - one each for frontend and API service.
- To enable review, deliverables must include code - not just executables. And per good programming practices, be sufficiently documented for ease of understanding.
## Optional Challenge (Complete as many as you like for extra credit.)
- One of the file types is .STL. It is a common CAD format used to represent the surface geometry of a 3D object. Add support in the 'viewer' to display the 3D object.
- Add features, including buttons or mouse-based input to manipulate the displayed 3D object. Allow translation, rotation, zoom-in/out.
- Add support for viewing .PLY files, another CAD format.
## Submission
In order to submit the assignment, do the following:

1. Navigate to GitHub's project import page: [https://github.com/new/import](https://github.com/new/import)

2. In the box titled "Your old repository's clone URL", paste the homework repository's link: [https://github.com/Machina-Labs/CompGeo_Make_STL](https://github.com/Machina-Labs/Web_File_Mgr_hw)

3. In the box titled "Repository Name", add a name for your local homework (ex. `Web_FMgr_soln`)

4. Set privacy level to "Public", then click "Begin Import" button at bottom of the page.

5. Develop your homework solution in the cloned repository and push it to Github when you're done. Extra points for good Git hygiene.

6. Send us the link to your repository.
