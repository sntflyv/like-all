
-- 任务
CREATE TABLE IF NOT EXISTS `ig_task` (
    `task_id` int(11) NOT NULL AUTO_INCREMENT comment '任务id',
    `user_id` int(11) not null default 0 comment '用户ID',
    `name` varchar(512) not null default '' comment '昵称',
    `service_type` varchar(16) DEFAULT NULL COMMENT '类型ins_follow ins_like',
    `link` varchar(1024) DEFAULT NULL COMMENT '页面url',
    `quantity` int(11) not null default 0 COMMENT '要加多少个',
    `pointer` int(11) not null default 0 COMMENT '每个给多少个点',
    `last_work_time` int not null default 0 COMMENT '上次工作时间',
    `start_count` int(11) not null default 0 COMMENT '开始值',
    `added` int(11) not null default 0 COMMENT '加了多少',
    `comment` varchar(2048) not null default '' comment '备注',
    `create_time` int not null default 0 comment '创建时间',
    `complete_time` int not null default 0 comment '结束时间',
    PRIMARY KEY (`task_id`),
    KEY `user_id` (`user_id`),
    KEY `name` (`name`),
    KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 实际工作
CREATE TABLE IF NOT EXISTS `ig_work` (
    `work_id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) not null default 0,
    `task_id` int(11) not null default 0,
    `complete_time` int not null default 0,
    `service_type` varchar(56) DEFAULT NULL COMMENT 'ins_follow in_slike',
    `pointer` int(11) not null default 0 COMMENT '赚了多少个点',
    `from_acc` varchar(512) DEFAULT NULL,
    `target_acc` varchar(512) DEFAULT NULL,
    `create_time` int not null default 0 comment '创建时间',
    PRIMARY KEY (`work_id`),
    KEY `user_id` (`user_id`),
    KEY `task_id` (`task_id`),
    KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 统计信息
CREATE TABLE IF NOT EXISTS `ig_statistics` (
    `stat_id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) not null default 0,
    `balance` int(11) not null default 0,
    `block_index` int(11) not null default 0,
    `create_time` int not null default 0 COMMENT '创建日期',
    `update_time` int not null default 0,
    PRIMARY KEY (`stat_id`),
    KEY `user_id` (`user_id`),
    KEY `update_time` (`update_time`),
    KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 用户资金变化记录区块。所有的资金变化都在这里，不可更改。只能增加
--
CREATE TABLE IF NOT EXISTS `ig_block` (
    `block_id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) NOT NULL,
    `amount` float NOT NULL COMMENT '金额 支出为负数',
    `type` varchar(16) DEFAULT NULL COMMENT '交易类型？ task recive send proxy1',
    `work_id` int(11) not null default 0 COMMENT '工作id ',
    `peer_user` int(11) not null default 0 COMMENT '交易的user ',
    `comment` varchar(1024) DEFAULT NULL,
    `create_time` int not null default 0 COMMENT '交易日期',
    PRIMARY KEY (`block_id`),
    KEY `user_id` (`user_id`),
    KEY `peer_user` (`peer_user`),
    KEY `create_time` (`create_time`),
    KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
