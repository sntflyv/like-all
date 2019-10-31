<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "ig_statistics".
 *
 * @property int $stat_id
 * @property int $user_id
 * @property int $balance
 * @property int $block_index
 * @property int $create_time 创建日期
 * @property int $update_time
 */
class Statistics extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ig_statistics';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'balance', 'block_index', 'create_time', 'update_time'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'stat_id' => 'Stat ID',
            'user_id' => 'User ID',
            'balance' => 'Balance',
            'block_index' => 'Block Index',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
        ];
    }
}
