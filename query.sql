--I ran this first in MySQL workbench to create the view
CREATE VIEW master_query AS
(SELECT customer.ID AS customer_id,
customer.name,
contract.ID AS contract_id,
customer_parts.ID AS customer_part_id,
customer_parts.CAD_file_ID as parent_CAD_file_ID,
cad_files.ID AS CAD_file_ID,
cad_files.file_name,
cad_files.container,
slice_files.ID as slice_file_ID,
slice_files.file_name AS slice_file_name,
slice_files.container AS slice_file_container,
build_files.file_name AS build_file_name,
build_files.container AS build_file_container,
run.job_ID,
run.ID AS test_run_ID,
scan_raw.ID AS scan_ID,
scan_raw.rsi_file_name,
scan_raw.scan_file_name,
scan_result.mesh_file_name,
scan_result.ptcloud_file_name,
scan_metric.zmetric_file_name
FROM customer
LEFT JOIN contract ON customer.ID = contract.customer_ID
LEFT JOIN customer_parts ON customer.ID = customer_parts.customer_ID
INNER JOIN cad_files ON customer_parts.CAD_file_ID = cad_files.parent_CAD_ID
LEFT JOIN slice_files ON slice_files.CAD_file_ID = cad_files.ID
LEFT JOIN build_files ON build_files.slice_file_ID = slice_files.ID
LEFT JOIN run ON run.build_file_ID = build_files.ID
LEFT JOIN scan_raw ON scan_raw.run_ID = run.ID
LEFT JOIN scan_result ON scan_result.scan_ID = scan_raw.ID
LEFT JOIN scan_metric ON scan_metric.scan_ID = scan_raw.ID)
UNION
(SELECT customer.ID AS customer_id,
customer.name,
contract.ID AS contract_id,
customer_parts.ID AS customer_part_id,
customer_parts.CAD_file_ID as parent_CAD_file_ID,
cad_files.ID AS CAD_file_ID,
cad_files.file_name AS CAD_file_name,
cad_files.container,
slice_files.ID as slice_file_ID,
slice_files.file_name AS slice_file_name,
slice_files.container AS slice_file_container,
build_files.file_name AS build_file_name,
build_files.container AS build_file_container,
run.job_ID,
run.ID AS test_run_ID,
scan_raw.ID AS scan_ID,
scan_raw.rsi_file_name,
scan_raw.scan_file_name,
scan_result.mesh_file_name,
scan_result.ptcloud_file_name,
scan_metric.zmetric_file_name
FROM customer
LEFT JOIN contract ON customer.ID = contract.customer_ID
LEFT JOIN customer_parts ON customer.ID = customer_parts.customer_ID
LEFT JOIN cad_files ON customer_parts.CAD_file_ID = cad_files.ID
LEFT JOIN slice_files ON slice_files.CAD_file_ID = cad_files.ID
LEFT JOIN build_files ON build_files.slice_file_id = slice_files.ID
LEFT JOIN run ON run.build_file_ID = build_files.ID
LEFT JOIN scan_raw ON scan_raw.run_ID = run.ID
LEFT JOIN scan_result ON scan_result.scan_ID = scan_raw.ID
LEFT JOIN scan_metric ON scan_metric.scan_ID = scan_raw.ID);
