<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "ig_work".
 *
 * @property int $work_id
 * @property int $user_id
 * @property int $task_id
 * @property int $complete_time
 * @property string $service_type ins_follow in_slike
 * @property int $pointer 赚了多少个点
 * @property string $from_acc
 * @property string $target_acc
 * @property int $create_time 创建时间
 */
class Work extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ig_work';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'task_id', 'complete_time', 'pointer', 'create_time'], 'integer'],
            [['service_type'], 'string', 'max' => 56],
            [['from_acc', 'target_acc'], 'string', 'max' => 512],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'work_id' => 'Work ID',
            'user_id' => 'User ID',
            'task_id' => 'Task ID',
            'complete_time' => 'Complete Time',
            'service_type' => 'Service Type',
            'pointer' => 'Pointer',
            'from_acc' => 'From Acc',
            'target_acc' => 'Target Acc',
            'create_time' => 'Create Time',
        ];
    }
}
