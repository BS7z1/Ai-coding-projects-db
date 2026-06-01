-- ============================================================
-- 认证模块建表及初始化数据
-- 数据库：chenziyi
-- 时间：2026-06-01
-- ============================================================

USE `chenziyi`;

-- ------------------------------------------------------------
-- 系统用户表
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
    `id`          BIGINT       NOT NULL AUTO_INCREMENT   COMMENT '主键',
    `username`    VARCHAR(64)  NOT NULL                  COMMENT '登录名（用户名）',
    `password`    VARCHAR(255) NOT NULL                  COMMENT '密码（BCrypt加密）',
    `emp_no`      VARCHAR(64)  DEFAULT NULL              COMMENT '员工号',
    `real_name`   VARCHAR(64)  DEFAULT NULL              COMMENT '真实姓名',
    `bank_code`   VARCHAR(32)  DEFAULT '001'             COMMENT '银行机构代码',
    `org_no`      VARCHAR(32)  DEFAULT '0001'            COMMENT '机构号',
    `org_name`    VARCHAR(128) DEFAULT '总行'             COMMENT '机构名称',
    `status`      TINYINT      NOT NULL DEFAULT 1        COMMENT '账号状态：0=禁用，1=启用',
    `create_time` DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0        COMMENT '软删除：0=正常，1=已删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户表';

-- ------------------------------------------------------------
-- 初始化用户数据
-- 密码统一为 123456，BCrypt 加密
-- $2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2 = 123456
-- ------------------------------------------------------------
INSERT INTO `t_sys_user`
    (`username`, `password`, `emp_no`, `real_name`, `bank_code`, `org_no`, `org_name`, `status`)
VALUES
    -- 管理员账号
    ('admin',
     '$2b$10$A7cxeTAMv00WLB23Q.Em..exyxuxnYRgnZsuApZUvBDi8d.eRqy5q',
     'EMP001', '系统管理员', '001', '0001', '总行', 1),

    -- 普通申请岗账号
    ('user1',
     '$2b$10$A7cxeTAMv00WLB23Q.Em..exyxuxnYRgnZsuApZUvBDi8d.eRqy5q',
     'EMP002', '张三', '001', '0001', '总行', 1),

    -- 复核岗账号
    ('reviewer1',
     '$2b$10$A7cxeTAMv00WLB23Q.Em..exyxuxnYRgnZsuApZUvBDi8d.eRqy5q',
     'EMP003', '李四', '001', '0001', '总行', 1);

-- 查看初始化结果
SELECT id, username, emp_no, real_name, org_name, status FROM `t_sys_user`;
