package gov.acwi.nwqmc.etl.dbSetup;

import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.configuration.annotation.StepScope;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
@StepScope
public class DropRi implements Tasklet {

	private final JdbcTemplate jdbcTemplate;
	private final String datasource;

	@Autowired
	public DropRi(JdbcTemplate jdbcTemplate,
			@Value("#{jobParameters['datasource']}") String datasource) {
		this.jdbcTemplate = jdbcTemplate;
		this.datasource = datasource;
	}

	@Override
	public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
		jdbcTemplate.update("call etl_helper_main.drop_ri(?)", datasource);
		return RepeatStatus.FINISHED;
	}
}