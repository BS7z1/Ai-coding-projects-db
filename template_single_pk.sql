-- ============================================================
-- 单主键模板数据库建立
-- 数据库：chenziyi
-- 时间：2026-06-01
-- ============================================================

USE `chenziyi`;

CREATE TABLE `template_single_pk` (
  `tsk_id`          VARCHAR(200)  NOT NULL                COMMENT '流水号',
  `loan_id`         VARCHAR(50)   NOT NULL                COMMENT '借据号',
  `company_name`    VARCHAR(200)  NOT NULL                COMMENT '公司名称',
  `credit_code`     CHAR(18)      NOT NULL                COMMENT '企业统一信用代码',
  `amount`          DECIMAL(15,2) NOT NULL                COMMENT '借据金额（元）',
  `interest_rate`   DECIMAL(7,4)  NOT NULL                COMMENT '利率（%）',
  `is_valid`        CHAR(1)       NOT NULL DEFAULT 0      COMMENT '是否有效：0否 1是',
  `emp_no`          VARCHAR(50)   NULL                    COMMENT '用户工号',
  `emp_nm`          VARCHAR(50)   NULL                    COMMENT '用户名称',
  `start_tm`        DATE          NULL                    COMMENT '起始时间',
  `updated_tm`      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`tsk_id`),
  UNIQUE KEY `uk_loan_id` (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单主键模板';

