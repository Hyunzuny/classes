	SELECT *
	FROM (
			SELECT 
				E.emp_name
				,D.dept_name
				,J.job_title
			FROM emp E
				JOIN emp M
					ON E.mgr_id = M.emp_id
					AND E.dept_id = M.dept_id
				LEFT JOIN job J
					ON E.job_id = J.job_id
				LEFT JOIN dept D
					ON E.dept_id = D.dept_id
			WHERE 1=1 -- TURE
	) k  -- 가로치면 서브쿼리니까 무조건 ALIAS 를 줘야한다.
