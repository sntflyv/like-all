<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "ig_task".
 *
 * @property int $task_id 任务id
 * @property int $user_id 用户ID
 * @property string $name 昵称
 * @property string $service_type 类型ins_follow ins_like
 * @property string $link 页面url
 * @property int $quantity 要加多少个
 * @property int $pointer 每个给多少个点
 * @property int $last_work_time 上次工作时间
 * @property int $start_count 开始值
 * @property int $added 加了多少
 * @property string $comment 备注
 * @property int $create_time 创建时间
 * @property int $complete_time 结束时间
 */
class Task extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ig_task';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'quantity', 'pointer', 'last_work_time', 'start_count', 'added', 'create_time', 'complete_time'], 'integer'],
            [['name'], 'string', 'max' => 512],
            [['service_type'], 'string', 'max' => 16],
            [['link'], 'string', 'max' => 1024],
            [['comment'], 'string', 'max' => 2048],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'task_id' => 'Task ID',
            'user_id' => 'User ID',
            'name' => 'Name',
            'service_type' => 'Service Type',
            'link' => 'Link',
            'quantity' => 'Quantity',
            'pointer' => 'Pointer',
            'last_work_time' => 'Last Work Time',
            'start_count' => 'Start Count',
            'added' => 'Added',
            'comment' => 'Comment',
            'create_time' => 'Create Time',
            'complete_time' => 'Complete Time',
        ];
    }
}
