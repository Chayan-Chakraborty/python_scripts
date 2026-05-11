WITH -- Current month data (up to selected date) - UNIQUE USERS, AMOUNTS IN LAKHS
current_month AS (
  SELECT
    COUNT(
      DISTINCT CASE
        WHEN is_registered > 0 THEN user_id
      END
    ) as registered_user,
    COUNT(
      DISTINCT CASE
        WHEN active_user > 0 THEN user_id
      END
    ) as active_user,
	SUM(user_sessions) as user_sessions,
    COUNT(
      DISTINCT CASE
        WHEN qg_active_user > 0 THEN user_id
      END
    ) as qg_active_user,
    COUNT(
      DISTINCT CASE
        WHEN qg_created_user > 0 THEN user_id
      END
    ) as qg_created_user,
    SUM(qg_created_count) as qg_created_count,
    ROUND(SUM(qg_total_amount) / NULLIF(SUM(qg_created_count), 0) / 100000, 2) AS qg_total_amount_lakhs,
    COUNT(
      DISTINCT CASE
        WHEN qg_shared_user > 0 THEN user_id
      END
    ) as qg_shared_user,
    SUM(qg_shared_count) as qg_shared_count,
    ROUND(SUM(qg_shared_amount) / NULLIF(SUM(qg_shared_count), 0) / 100000, 2) AS qg_shared_amount_lakhs,
    SUM(qg_total_views) as qg_total_views,
    COUNT(
      DISTINCT CASE
        WHEN dp_active_user > 0 THEN user_id
      END
    ) as dp_active_user,
    COUNT(
      DISTINCT CASE
        WHEN dp_profile_created > 0 THEN user_id
      END
    ) as dp_profile_created,
    COUNT(
      DISTINCT CASE
        WHEN discover_clicked_user > 0 THEN user_id
      END
    ) as discover_clicked_user,
    SUM(dp_profile_shared_count) as dp_profile_shared_count,
    COUNT(
      DISTINCT CASE
        WHEN dp_profile_shared_user > 0 THEN user_id
      END
    ) as dp_profile_shared_user
 
FROM
    user_daily_metrics_fact
 
WHERE
    activity_date >= DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND activity_date <= CURRENT_DATE
    [[AND city = {{city}}]]
),
-- Previous month: full prior calendar month (e.g. Mar 1–Mar 31 when current_date is any day in April)
previous_month AS (
  SELECT
    COUNT(
      DISTINCT CASE
        WHEN is_registered > 0 THEN user_id
      END
    ) as registered_user,
    COUNT(
      DISTINCT CASE
        WHEN active_user > 0 THEN user_id
      END
    ) as active_user,
	SUM(user_sessions) as user_sessions,
    COUNT(
      DISTINCT CASE
        WHEN qg_active_user > 0 THEN user_id
      END
    ) as qg_active_user,
    COUNT(
      DISTINCT CASE
        WHEN qg_created_user > 0 THEN user_id
      END
    ) as qg_created_user,
    SUM(qg_created_count) as qg_created_count,
    ROUND(SUM(qg_total_amount) / NULLIF(SUM(qg_created_count), 0) / 100000, 2) AS qg_total_amount_lakhs,
    COUNT(
      DISTINCT CASE
        WHEN qg_shared_user > 0 THEN user_id
      END
    ) as qg_shared_user,
    SUM(qg_shared_count) as qg_shared_count,
    ROUND(SUM(qg_shared_amount) / NULLIF(SUM(qg_shared_count), 0) / 100000, 2) AS qg_shared_amount_lakhs,
    SUM(qg_total_views) as qg_total_views,
    COUNT(
      DISTINCT CASE
        WHEN dp_active_user > 0 THEN user_id
      END
    ) as dp_active_user,
    COUNT(
      DISTINCT CASE
        WHEN dp_profile_created > 0 THEN user_id
      END
    ) as dp_profile_created,
    COUNT(
      DISTINCT CASE
        WHEN discover_clicked_user > 0 THEN user_id
      END
    ) as discover_clicked_user,
    SUM(dp_profile_shared_count) as dp_profile_shared_count,
    COUNT(
      DISTINCT CASE
        WHEN dp_profile_shared_user > 0 THEN user_id
      END
    ) as dp_profile_shared_user
  FROM
    user_daily_metrics_fact
  WHERE
    activity_date >= DATE_SUB(DATE_FORMAT(CURRENT_DATE, '%Y-%m-01'), INTERVAL 1 MONTH)
    AND activity_date < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    [[AND city = {{city}}]]
),
day_minus_1 AS (
  SELECT
    COUNT(
      DISTINCT CASE
        WHEN is_registered > 0 THEN user_id
      END
    ) as registered_user,
    COUNT(
      DISTINCT CASE
        WHEN active_user > 0 THEN user_id
      END
    ) as active_user,
	SUM(user_sessions) as user_sessions,
    COUNT(
      DISTINCT CASE
        WHEN qg_active_user > 0 THEN user_id
      END
    ) as qg_active_user,
    COUNT(
      DISTINCT CASE
        WHEN qg_created_user > 0 THEN user_id
      END
    ) as qg_created_user,
    SUM(qg_created_count) as qg_created_count,
    ROUND(SUM(qg_total_amount) / NULLIF(SUM(qg_created_count), 0) / 100000, 2) AS qg_total_amount_lakhs,
    COUNT(
      DISTINCT CASE
        WHEN qg_shared_user > 0 THEN user_id
      END
    ) as qg_shared_user,
    SUM(qg_shared_count) as qg_shared_count,
    ROUND(SUM(qg_shared_amount) / NULLIF(SUM(qg_shared_count), 0) / 100000, 2) AS qg_shared_amount_lakhs,
    SUM(qg_total_views) as qg_total_views,
    COUNT(
      DISTINCT CASE
        WHEN dp_active_user > 0 THEN user_id
      END
    ) as dp_active_user,
    COUNT(
      DISTINCT CASE
        WHEN dp_profile_created > 0 THEN user_id
      END
    ) as dp_profile_created,
    COUNT(
      DISTINCT CASE
        WHEN discover_clicked_user > 0 THEN user_id
      END
    ) as discover_clicked_user,
    SUM(dp_profile_shared_count) as dp_profile_shared_count,
    COUNT(
      DISTINCT CASE
        WHEN dp_profile_shared_user > 0 THEN user_id
      END
    ) as dp_profile_shared_user
  FROM
    user_daily_metrics_fact
  WHERE
    activity_date = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
    [[AND city = {{city}}]]
),
-- QG VIEWED COUNT (current month) - query source tables directly
qg_viewed_current AS (
  SELECT
    COUNT(DISTINCT eh.estimator_id) as quotations_viewed
  FROM estimator_history eh
  JOIN estimator e ON eh.estimator_id = e.id
  JOIN app_user_v2 a ON e.user_id = a.id
  LEFT JOIN internal_users i ON i.user_id = a.id
  LEFT JOIN city_mapping cm ON a.city = cm.actual_city
  LEFT JOIN (
    SELECT 
        estimator_id,
        MAX(view_count) as prev_view_count
    FROM estimator_history
    WHERE DATE(created_at) < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    GROUP BY estimator_id
  ) eh_prev ON eh.estimator_id = eh_prev.estimator_id
  WHERE DATE(eh.created_at) >= DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND DATE(eh.created_at) <= CURRENT_DATE
    AND i.user_id IS NULL
    AND eh.view_count > COALESCE(eh_prev.prev_view_count, 0)
    [[AND COALESCE(cm.referred_city, 'Others') = {{city}}]]
),
-- QG VIEWED COUNT (previous month) - query source tables directly
qg_viewed_previous AS (
  SELECT
    COUNT(DISTINCT eh.estimator_id) as quotations_viewed
  FROM estimator_history eh
  JOIN estimator e ON eh.estimator_id = e.id
  JOIN app_user_v2 a ON e.user_id = a.id
  LEFT JOIN internal_users i ON i.user_id = a.id
  LEFT JOIN city_mapping cm ON a.city = cm.actual_city
  LEFT JOIN (
    SELECT 
        estimator_id,
        MAX(view_count) as prev_view_count
    FROM estimator_history
    WHERE DATE(created_at) < DATE_SUB(DATE_FORMAT(CURRENT_DATE, '%Y-%m-01'), INTERVAL 1 MONTH)
    GROUP BY estimator_id
  ) eh_prev ON eh.estimator_id = eh_prev.estimator_id
  WHERE DATE(eh.created_at) >= DATE_SUB(DATE_FORMAT(CURRENT_DATE, '%Y-%m-01'), INTERVAL 1 MONTH)
    AND DATE(eh.created_at) < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND i.user_id IS NULL
    AND eh.view_count > COALESCE(eh_prev.prev_view_count, 0)
    [[AND COALESCE(cm.referred_city, 'Others') = {{city}}]]
),
qg_viewed_day_minus_1 AS (
  SELECT
    COUNT(DISTINCT eh.estimator_id) as quotations_viewed
  FROM estimator_history eh
  JOIN estimator e ON eh.estimator_id = e.id
  JOIN app_user_v2 a ON e.user_id = a.id
  LEFT JOIN internal_users i ON i.user_id = a.id
  LEFT JOIN city_mapping cm ON a.city = cm.actual_city
  LEFT JOIN (
    SELECT
        estimator_id,
        MAX(view_count) as prev_view_count
    FROM estimator_history
    WHERE DATE(created_at) < DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
    GROUP BY estimator_id
  ) eh_prev ON eh.estimator_id = eh_prev.estimator_id
  WHERE DATE(eh.created_at) = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
    AND i.user_id IS NULL
    AND eh.view_count > COALESCE(eh_prev.prev_view_count, 0)
    [[AND COALESCE(cm.referred_city, 'Others') = {{city}}]]
),
-- NEW PROFILES WITH PHOTOS (current month) - query source tables directly
new_profile_metrics_current AS (
  SELECT
    COUNT(DISTINCT d.id) as new_profiles_with_photos,
    COUNT(pmg.id) as new_photos_added
  FROM digital_profiles d
  JOIN app_user_v2 a ON d.contractor_uuid = a.id
  LEFT JOIN internal_users i ON i.user_id = a.id
  LEFT JOIN city_mapping cm ON a.city = cm.actual_city
  JOIN projects_digital_profile_links pdp ON d.id = pdp.digital_profile_id
  JOIN project_media_galleries_project_links pmg_link ON pmg_link.project_id = pdp.project_id
  JOIN project_media_galleries pmg ON pmg.id = pmg_link.project_media_gallery_id
  WHERE DATE(pmg.created_at) >= DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND DATE(pmg.created_at) <= CURRENT_DATE
    AND DATE(d.created_at) >= DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND DATE(d.created_at) <= CURRENT_DATE
    AND i.user_id IS NULL
    [[AND COALESCE(cm.referred_city, 'Others') = {{city}}]]
),
-- REPEAT PROFILES WITH PHOTOS (current month) - query source tables directly
repeat_profile_metrics_current AS (
  SELECT
    COUNT(DISTINCT d.id) as repeat_profiles_with_photos,
    COUNT(pmg.id) as repeat_photos_added
  FROM project_media_galleries pmg
  JOIN project_media_galleries_project_links pmgpl ON pmg.id = pmgpl.project_media_gallery_id
  JOIN projects_digital_profile_links pdp ON pmgpl.project_id = pdp.project_id
  JOIN digital_profiles d ON pdp.digital_profile_id = d.id
  JOIN app_user_v2 a ON d.contractor_uuid = a.id
  LEFT JOIN internal_users i ON i.user_id = a.id
  LEFT JOIN city_mapping cm ON a.city = cm.actual_city
  WHERE DATE(pmg.created_at) >= DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND DATE(pmg.created_at) <= CURRENT_DATE
    AND DATE(d.created_at) < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND i.user_id IS NULL
    [[AND COALESCE(cm.referred_city, 'Others') = {{city}}]]
),
-- NEW PROFILES WITH PHOTOS (previous month) - query source tables directly
new_profile_metrics_previous AS (
  SELECT
    COUNT(DISTINCT d.id) as new_profiles_with_photos,
    COUNT(pmg.id) as new_photos_added
  FROM digital_profiles d
  JOIN app_user_v2 a ON d.contractor_uuid = a.id
  LEFT JOIN internal_users i ON i.user_id = a.id
  LEFT JOIN city_mapping cm ON a.city = cm.actual_city
  JOIN projects_digital_profile_links pdp ON d.id = pdp.digital_profile_id
  JOIN project_media_galleries_project_links pmg_link ON pmg_link.project_id = pdp.project_id
  JOIN project_media_galleries pmg ON pmg.id = pmg_link.project_media_gallery_id
  WHERE DATE(pmg.created_at) >= DATE_SUB(DATE_FORMAT(CURRENT_DATE, '%Y-%m-01'), INTERVAL 1 MONTH)
    AND DATE(pmg.created_at) < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND DATE(d.created_at) >= DATE_SUB(DATE_FORMAT(CURRENT_DATE, '%Y-%m-01'), INTERVAL 1 MONTH)
    AND DATE(d.created_at) < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND i.user_id IS NULL
    [[AND COALESCE(cm.referred_city, 'Others') = {{city}}]]
),
-- REPEAT PROFILES WITH PHOTOS (previous month) - query source tables directly
repeat_profile_metrics_previous AS (
  SELECT
    COUNT(DISTINCT d.id) as repeat_profiles_with_photos,
    COUNT(pmg.id) as repeat_photos_added
  FROM project_media_galleries pmg
  JOIN project_media_galleries_project_links pmgpl ON pmg.id = pmgpl.project_media_gallery_id
  JOIN projects_digital_profile_links pdp ON pmgpl.project_id = pdp.project_id
  JOIN digital_profiles d ON pdp.digital_profile_id = d.id
  JOIN app_user_v2 a ON d.contractor_uuid = a.id
  LEFT JOIN internal_users i ON i.user_id = a.id
  LEFT JOIN city_mapping cm ON a.city = cm.actual_city
  WHERE DATE(pmg.created_at) >= DATE_SUB(DATE_FORMAT(CURRENT_DATE, '%Y-%m-01'), INTERVAL 1 MONTH)
    AND DATE(pmg.created_at) < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
    AND DATE(d.created_at) < DATE_SUB(DATE_FORMAT(CURRENT_DATE, '%Y-%m-01'), INTERVAL 1 MONTH)
    AND i.user_id IS NULL
    [[AND COALESCE(cm.referred_city, 'Others') = {{city}}]]
),
new_profile_metrics_day_minus_1 AS (
  SELECT
    COUNT(DISTINCT d.id) as new_profiles_with_photos,
    COUNT(pmg.id) as new_photos_added
  FROM digital_profiles d
  JOIN app_user_v2 a ON d.contractor_uuid = a.id
  LEFT JOIN internal_users i ON i.user_id = a.id
  LEFT JOIN city_mapping cm ON a.city = cm.actual_city
  JOIN projects_digital_profile_links pdp ON d.id = pdp.digital_profile_id
  JOIN project_media_galleries_project_links pmg_link ON pmg_link.project_id = pdp.project_id
  JOIN project_media_galleries pmg ON pmg.id = pmg_link.project_media_gallery_id
  WHERE DATE(pmg.created_at) = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
    AND DATE(d.created_at) = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
    AND i.user_id IS NULL
    [[AND COALESCE(cm.referred_city, 'Others') = {{city}}]]
),
repeat_profile_metrics_day_minus_1 AS (
  SELECT
    COUNT(DISTINCT d.id) as repeat_profiles_with_photos,
    COUNT(pmg.id) as repeat_photos_added
  FROM project_media_galleries pmg
  JOIN project_media_galleries_project_links pmgpl ON pmg.id = pmgpl.project_media_gallery_id
  JOIN projects_digital_profile_links pdp ON pmgpl.project_id = pdp.project_id
  JOIN digital_profiles d ON pdp.digital_profile_id = d.id
  JOIN app_user_v2 a ON d.contractor_uuid = a.id
  LEFT JOIN internal_users i ON i.user_id = a.id
  LEFT JOIN city_mapping cm ON a.city = cm.actual_city
  WHERE DATE(pmg.created_at) = DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
    AND DATE(d.created_at) < DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY)
    AND i.user_id IS NULL
    [[AND COALESCE(cm.referred_city, 'Others') = {{city}}]]
),
-- One row per (module, metric) for D-1 values (same sources as standalone day_minus_1 + event tables)
day_minus_1_by_metric AS (
  SELECT 'All' AS module, 'Registered Users' AS metric, CAST(d.registered_user AS SIGNED) AS day_minus_1 FROM day_minus_1 d
  UNION ALL SELECT 'All', 'Active Users', CAST(d.active_user AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'All', 'User Sessions', CAST(d.user_sessions AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Active Users', CAST(d.qg_active_user AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Created Users', CAST(d.qg_created_user AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Created Count', CAST(d.qg_created_count AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Created / User',
    CASE WHEN d.qg_created_user > 0 THEN ROUND(d.qg_created_count * 1.0 / d.qg_created_user, 2) ELSE 0 END FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Total Amount (Lakhs)', d.qg_total_amount_lakhs FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Shared Users', CAST(d.qg_shared_user AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Shared Count', CAST(d.qg_shared_count AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Shared / User',
    CASE WHEN d.qg_shared_user > 0 THEN ROUND(d.qg_shared_count * 1.0 / d.qg_shared_user, 2) ELSE 0 END FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Shared Amount (Lakhs)', d.qg_shared_amount_lakhs FROM day_minus_1 d
  UNION ALL SELECT 'QG', 'QG Viewed Count', CAST(qvd.quotations_viewed AS SIGNED) FROM qg_viewed_day_minus_1 qvd
  UNION ALL SELECT 'QG', 'QG Total Views', CAST(d.qg_total_views AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'DP', 'DP Active Users', CAST(d.dp_active_user AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'DP', 'DP Profile Created', CAST(d.dp_profile_created AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'DP', 'DP Atleast 1 Photo', CAST(npd.new_profiles_with_photos AS SIGNED) FROM new_profile_metrics_day_minus_1 npd
  UNION ALL SELECT 'DP', 'DP Photos Added', CAST(npd.new_photos_added AS SIGNED) FROM new_profile_metrics_day_minus_1 npd
  UNION ALL SELECT 'DP', 'Photos / New DP User',
    CASE WHEN npd.new_profiles_with_photos > 0 THEN ROUND(npd.new_photos_added * 1.0 / npd.new_profiles_with_photos, 2) ELSE 0 END
    FROM new_profile_metrics_day_minus_1 npd
  UNION ALL SELECT 'DP', 'Repeat User Count', CAST(rpd.repeat_profiles_with_photos AS SIGNED) FROM repeat_profile_metrics_day_minus_1 rpd
  UNION ALL SELECT 'DP', 'Repeat Photos Added', CAST(rpd.repeat_photos_added AS SIGNED) FROM repeat_profile_metrics_day_minus_1 rpd
  UNION ALL SELECT 'DP', 'Photos / Repeat User',
    CASE WHEN rpd.repeat_profiles_with_photos > 0 THEN ROUND(rpd.repeat_photos_added * 1.0 / rpd.repeat_profiles_with_photos, 2) ELSE 0 END
    FROM repeat_profile_metrics_day_minus_1 rpd
  UNION ALL SELECT 'DP', 'Discover Clicked', CAST(d.discover_clicked_user AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'DP', 'DP Profile Shared', CAST(d.dp_profile_shared_count AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'DP', 'DP Profile Shared Users', CAST(d.dp_profile_shared_user AS SIGNED) FROM day_minus_1 d
  UNION ALL SELECT 'DP', 'DP Shared / User',
    CASE WHEN d.dp_profile_shared_user > 0 THEN ROUND(d.dp_profile_shared_count * 1.0 / d.dp_profile_shared_user, 2) ELSE 0 END FROM day_minus_1 d
),
-- Unpivot metrics into rows
metrics AS (
  SELECT
    'All' as module,
    'Registered Users' as metric,
    CAST(c.registered_user AS SIGNED) as current_month,
    CAST(p.registered_user AS SIGNED) as previous_month,
    NULL as conversion_current,
    NULL as conversion_previous
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'All' as module,
    'Active Users' as metric,
    CAST(c.active_user AS SIGNED) as current_month,
    CAST(p.active_user AS SIGNED) as previous_month,
    NULL as conversion_current,
    NULL as conversion_previous
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'All' as module,
    'User Sessions' as metric,
    CAST(c.user_sessions AS SIGNED) as current_month,
    CAST(p.user_sessions AS SIGNED) as previous_month,
    NULL as conversion_current,
    NULL as conversion_previous
  FROM
    current_month c,
    previous_month p	
  UNION ALL
  SELECT
    'QG',
    'QG Active Users',
    CAST(c.qg_active_user AS SIGNED),
    CAST(p.qg_active_user AS SIGNED),
    ROUND(c.qg_active_user * 100.0 / NULLIF(c.active_user, 0), 1),
    ROUND(p.qg_active_user * 100.0 / NULLIF(p.active_user, 0), 1)
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'QG',
    'QG Created Users',
    CAST(c.qg_created_user AS SIGNED),
    CAST(p.qg_created_user AS SIGNED),
    ROUND(c.qg_created_user * 100.0 / NULLIF(c.qg_active_user, 0), 1),
    ROUND(p.qg_created_user * 100.0 / NULLIF(p.qg_active_user, 0), 1)
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'QG',
    'QG Created Count',
    CAST(c.qg_created_count AS SIGNED),
    CAST(p.qg_created_count AS SIGNED),
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'QG',
    'QG Total Amount (Lakhs)',
    c.qg_total_amount_lakhs,
    p.qg_total_amount_lakhs,
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'QG',
    'QG Shared Users',
    CAST(c.qg_shared_user AS SIGNED),
    CAST(p.qg_shared_user AS SIGNED),
    ROUND(c.qg_shared_user * 100.0 / NULLIF(c.qg_created_user, 0), 1),
    ROUND(p.qg_shared_user * 100.0 / NULLIF(p.qg_created_user, 0), 1)
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'QG',
    'QG Shared Count',
    CAST(c.qg_shared_count AS SIGNED),
    CAST(p.qg_shared_count AS SIGNED),
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'QG',
    'QG Shared Amount (Lakhs)',
    c.qg_shared_amount_lakhs,
    p.qg_shared_amount_lakhs,
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'QG',
    'QG Viewed Count',
    CAST(qvc.quotations_viewed AS SIGNED),
    CAST(qvp.quotations_viewed AS SIGNED),
    NULL,
    NULL
  FROM
    qg_viewed_current qvc,
    qg_viewed_previous qvp
  UNION ALL
  SELECT
    'QG',
    'QG Total Views',
    CAST(c.qg_total_views AS SIGNED),
    CAST(p.qg_total_views AS SIGNED),
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
  UNION ALL
  -- NEW DERIVED METRIC 1: QG Created / User
  SELECT
    'QG',
    'QG Created / User',
    CASE
      WHEN c.qg_created_user > 0
        THEN ROUND(c.qg_created_count * 1.0 / c.qg_created_user, 2)
      ELSE 0
    END,
    CASE
      WHEN p.qg_created_user > 0
        THEN ROUND(p.qg_created_count * 1.0 / p.qg_created_user, 2)
      ELSE 0
    END,
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
  UNION ALL
  -- NEW DERIVED METRIC 2: QG Shared / User
  SELECT
    'QG',
    'QG Shared / User',
    CASE
      WHEN c.qg_shared_user > 0
        THEN ROUND(c.qg_shared_count * 1.0 / c.qg_shared_user, 2)
      ELSE 0
    END,
    CASE
      WHEN p.qg_shared_user > 0
        THEN ROUND(p.qg_shared_count * 1.0 / p.qg_shared_user, 2)
      ELSE 0
    END,
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'DP',
    'DP Active Users',
    CAST(c.dp_active_user AS SIGNED),
    CAST(p.dp_active_user AS SIGNED),
    ROUND(c.dp_active_user * 100.0 / NULLIF(c.active_user, 0), 1),
    ROUND(p.dp_active_user * 100.0 / NULLIF(p.active_user, 0), 1)
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'DP',
    'DP Profile Created',
    CAST(c.dp_profile_created AS SIGNED),
    CAST(p.dp_profile_created AS SIGNED),
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'DP',
    'DP Atleast 1 Photo',
    CAST(npc.new_profiles_with_photos AS SIGNED),
    CAST(npp.new_profiles_with_photos AS SIGNED),
    ROUND(npc.new_profiles_with_photos * 100.0 / NULLIF(c.dp_profile_created, 0), 1),
    ROUND(npp.new_profiles_with_photos * 100.0 / NULLIF(p.dp_profile_created, 0), 1)
  FROM
    new_profile_metrics_current npc,
    new_profile_metrics_previous npp,
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'DP',
    'DP Photos Added',
    CAST(npc.new_photos_added AS SIGNED),
    CAST(npp.new_photos_added AS SIGNED),
    NULL,
    NULL
  FROM
    new_profile_metrics_current npc,
    new_profile_metrics_previous npp
  UNION ALL
  -- NEW DERIVED METRIC 3: Photo Added / Photo Added Users (New)
  SELECT
    'DP',
    'Photos / New DP User',
    CASE
      WHEN npc.new_profiles_with_photos > 0
        THEN ROUND(npc.new_photos_added * 1.0 / npc.new_profiles_with_photos, 2)
      ELSE 0
    END,
    CASE
      WHEN npp.new_profiles_with_photos > 0
        THEN ROUND(npp.new_photos_added * 1.0 / npp.new_profiles_with_photos, 2)
      ELSE 0
    END,
    NULL,
    NULL
  FROM
    new_profile_metrics_current npc,
    new_profile_metrics_previous npp
  UNION ALL
  SELECT
    'DP',
    'Repeat User Count',
    CAST(rpc.repeat_profiles_with_photos AS SIGNED),
    CAST(rpp.repeat_profiles_with_photos AS SIGNED),
    ROUND(rpc.repeat_profiles_with_photos * 100.0 / NULLIF(c.dp_active_user, 0), 1),
    ROUND(rpp.repeat_profiles_with_photos * 100.0 / NULLIF(p.dp_active_user, 0), 1)
  FROM
    repeat_profile_metrics_current rpc,
    repeat_profile_metrics_previous rpp,
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'DP',
    'Repeat Photos Added',
    CAST(rpc.repeat_photos_added AS SIGNED),
    CAST(rpp.repeat_photos_added AS SIGNED),
    NULL,
    NULL
  FROM
    repeat_profile_metrics_current rpc,
    repeat_profile_metrics_previous rpp
  UNION ALL
  -- NEW DERIVED METRIC 4: Photos / Repeat User
  SELECT
    'DP',
    'Photos / Repeat User',
    CASE
      WHEN rpc.repeat_profiles_with_photos > 0
        THEN ROUND(rpc.repeat_photos_added * 1.0 / rpc.repeat_profiles_with_photos, 2)
      ELSE 0
    END,
    CASE
      WHEN rpp.repeat_profiles_with_photos > 0
        THEN ROUND(rpp.repeat_photos_added * 1.0 / rpp.repeat_profiles_with_photos, 2)
      ELSE 0
    END,
    NULL,
    NULL
  FROM
    repeat_profile_metrics_current rpc,
    repeat_profile_metrics_previous rpp
  UNION ALL
  SELECT
    'DP',
    'Discover Clicked',
    CAST(c.discover_clicked_user AS SIGNED),
    CAST(p.discover_clicked_user AS SIGNED),
    ROUND(c.discover_clicked_user * 100.0 / NULLIF(c.dp_active_user, 0), 1),
    ROUND(p.discover_clicked_user * 100.0 / NULLIF(p.dp_active_user, 0), 1)
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'DP',
    'DP Profile Shared',
    CAST(c.dp_profile_shared_count AS SIGNED),
    CAST(p.dp_profile_shared_count AS SIGNED),
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
  UNION ALL
  SELECT
    'DP',
    'DP Profile Shared Users',
    CAST(c.dp_profile_shared_user AS SIGNED),
    CAST(p.dp_profile_shared_user AS SIGNED),
    ROUND(c.dp_profile_shared_user * 100.0 / NULLIF(c.dp_active_user, 0), 1),
    ROUND(p.dp_profile_shared_user * 100.0 / NULLIF(p.dp_active_user, 0), 1)
  FROM
    current_month c,
    previous_month p
  UNION ALL
  -- NEW DERIVED METRIC 5: DP Shared / User
  SELECT
    'DP',
    'DP Shared / User',
    CASE
      WHEN c.dp_profile_shared_user > 0
        THEN ROUND(c.dp_profile_shared_count * 1.0 / c.dp_profile_shared_user, 2)
      ELSE 0
    END,
    CASE
      WHEN p.dp_profile_shared_user > 0
        THEN ROUND(p.dp_profile_shared_count * 1.0 / p.dp_profile_shared_user, 2)
      ELSE 0
    END,
    NULL,
    NULL
  FROM
    current_month c,
    previous_month p
),
metrics_with_day_minus_1 AS (
  SELECT
    m.*,
    dm.day_minus_1
  FROM metrics m
  LEFT JOIN day_minus_1_by_metric dm ON m.module = dm.module AND m.metric = dm.metric
) 
-- Final result
SELECT
  module,
  CASE
    WHEN module = 'All' AND metric = 'Registered Users' THEN 'New Registrations'
    WHEN module = 'All' AND metric = 'Active Users' THEN 'App Active Users'
    WHEN module = 'QG' AND metric = 'QG Active Users' THEN 'Active Users'
    WHEN module = 'QG' AND metric = 'QG Shared Users' THEN 'QG Shared Users'
    WHEN module = 'QG' AND metric = 'QG Shared Count' THEN 'QG Shared'
    WHEN module = 'QG' AND metric = 'QG Shared / User' THEN 'AVG Quote Shared'
    WHEN module = 'DP' AND metric = 'DP Active Users' THEN 'Active Users'
    WHEN module = 'DP' AND metric = 'DP Atleast 1 Photo' THEN 'Photo Added Users'
    WHEN module = 'DP' AND metric = 'DP Photos Added' THEN 'Project Photos added'
    WHEN module = 'DP' AND metric = 'DP Profile Shared' THEN 'DP Profile Shared'
    WHEN module = 'DP' AND metric = 'DP Profile Shared Users' THEN 'DP Profile Shared User'
    ELSE metric
  END as metric,
  day_minus_1 as 'Day - 1',
  current_month as 'Cur Month',
  conversion_current as 'Cur Con %',
  previous_month as 'Prev Month',
  conversion_previous as 'Prev Con %',
  CASE 
    WHEN metric IN ('QG Total Amount (Lakhs)', 'QG Shared Amount (Lakhs)') 
    THEN ROUND(current_month - previous_month, 2)
    ELSE CAST(ROUND(current_month - previous_month, 0) AS SIGNED)
  END as 'Abs' ,
  ROUND(
    (current_month) / NULLIF(previous_month, 0) * 100,
    2
  ) as '% Achievement',
  CASE
    WHEN conversion_current IS NOT NULL AND conversion_previous IS NOT NULL
    THEN ROUND(conversion_current - conversion_previous, 1)
    ELSE NULL
  END as 'Con %'
FROM
  metrics_with_day_minus_1
WHERE
  (module = 'All' AND metric IN ('Registered Users', 'Active Users'))
  OR (module = 'QG' AND metric IN ('QG Active Users', 'QG Shared Users', 'QG Shared Count', 'QG Shared / User'))
  OR (module = 'DP' AND metric IN ('DP Active Users', 'DP Atleast 1 Photo', 'DP Photos Added', 'DP Profile Shared', 'DP Profile Shared Users'))
ORDER BY
  CASE
    CONCAT(module, '|', metric)
    WHEN 'All|Registered Users' THEN 1
    WHEN 'All|Active Users' THEN 2
    WHEN 'QG|QG Active Users' THEN 3
    WHEN 'QG|QG Shared Users' THEN 4
    WHEN 'QG|QG Shared Count' THEN 5
    WHEN 'QG|QG Shared / User' THEN 6
    WHEN 'DP|DP Active Users' THEN 7
    WHEN 'DP|DP Atleast 1 Photo' THEN 8
    WHEN 'DP|DP Photos Added' THEN 9
    WHEN 'DP|DP Profile Shared' THEN 10
    WHEN 'DP|DP Profile Shared Users' THEN 11
  END;