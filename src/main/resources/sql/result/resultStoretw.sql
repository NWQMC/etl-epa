insert /*+ append parallel(4) */
  into result_swap_storet (data_source_id, data_source, station_id, site_id, event_date, analytical_method, activity,
                           characteristic_name, characteristic_type, sample_media, organization, site_type, huc, governmental_unit_code,
                           organization_name, activity_id, activity_type_code, activity_media_subdiv_name, activity_start_time,
                           act_start_time_zone, activity_stop_date, activity_stop_time, act_stop_time_zone, activity_depth,
                           activity_depth_unit, activity_depth_ref_point, activity_upper_depth, activity_upper_depth_unit,
                           activity_lower_depth, activity_lower_depth_unit, project_id, activity_conducting_org, activity_comment,
                           sample_collect_method_id, sample_collect_method_ctx, sample_collect_method_name, sample_collect_equip_name,
                           result_id, result_detection_condition_tx, sample_fraction_type, result_measure_value, result_unit,
                           result_meas_qual_code, result_value_status, statistic_type, result_value_type, weight_basis_type, duration_basis,
                           temperature_basis_level, particle_size, precision, result_comment, result_depth_meas_value,
                           result_depth_meas_unit_code, result_depth_alt_ref_pt_txt, sample_tissue_taxonomic_name,
                           analytical_procedure_id, analytical_procedure_source, analytical_method_name, lab_name,
                           analysis_start_date, lab_remark, detection_limit, detection_limit_unit, detection_limit_desc, analysis_prep_date_tx)
select 3 data_source_id,
       'STORET' data_source,
       a.*
  from (select /*+ parallel(4) */
               station.station_id,
               station.site_id,
               result_no_source.event_date,
               result_no_source.analytical_method,
               result_no_source.activity,
               result_no_source.characteristic_name,
               result_no_source.characteristic_type,
               result_no_source.sample_media,
               station.organization,
               station.site_type,
               station.huc,
               station.governmental_unit_code,
               station.organization_name,
               result_no_source.activity_id,
               result_no_source.activity_type_code,
               result_no_source.activity_media_subdiv_name,
               result_no_source.activity_start_time,
               result_no_source.act_start_time_zone,
               result_no_source.activity_stop_date,
               result_no_source.activity_stop_time,
               result_no_source.act_stop_time_zone,
               result_no_source.activity_depth,
               result_no_source.activity_depth_unit,
               result_no_source.activity_depth_ref_point,
               result_no_source.activity_upper_depth,
               result_no_source.activity_upper_depth_unit,
               result_no_source.activity_lower_depth,
               result_no_source.activity_lower_depth_unit,
               result_no_source.project_id,
               result_no_source.activity_conducting_org,
               result_no_source.activity_comment,
               result_no_source.sample_collect_method_id,
               result_no_source.sample_collect_method_ctx,
               result_no_source.sample_collect_method_name,
               result_no_source.sample_collect_equip_name,
               result_no_source.result_id,
               result_no_source.result_detection_condition_tx,
               result_no_source.sample_fraction_type,
               result_no_source.result_measure_value,
               result_no_source.result_unit,
               result_no_source.result_meas_qual_code,
               result_no_source.result_value_status,
               result_no_source.statistic_type,
               result_no_source.result_value_type,
               result_no_source.weight_basis_type,
               result_no_source.duration_basis,
               result_no_source.temperature_basis_level,
               result_no_source.particle_size,
               result_no_source.precision,
               result_no_source.result_comment,
               result_no_source.result_depth_meas_value,
               result_no_source.result_depth_meas_unit_code,
               result_no_source.result_depth_alt_ref_pt_txt,
               result_no_source.sample_tissue_taxonomic_name,
               result_no_source.analytical_procedure_id,
               result_no_source.analytical_procedure_source,
               result_no_source.analytical_method_name,
               result_no_source.lab_name,
               result_no_source.analysis_date_time,
               result_no_source.lab_remark,
               result_no_source.detection_limit,
               result_no_source.detection_limit_unit,
               result_no_source.detection_limit_desc,
               result_no_source.analysis_prep_date_tx
          from result_no_source
               join station_swap_storet station
                 on result_no_source.station_id + 10000000 = station.station_id) a