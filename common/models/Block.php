<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "ig_block".
 *
 * @property int $block_id
 * @property int $user_id
 * @property double $amount 金额 支出为负数
 * @property string $type 交易类型？ task recive send proxy1
 * @property int $work_id 工作id 
 * @property int $peer_user 交易的user 
 * @property string $comment
 * @property int $create_time 交易日期
 */
class Block extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ig_block';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'amount'], 'required'],
            [['user_id', 'work_id', 'peer_user', 'create_time'], 'integer'],
            [['amount'], 'number'],
            [['type'], 'string', 'max' => 16],
            [['comment'], 'string', 'max' => 1024],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'block_id' => 'Block ID',
            'user_id' => 'User ID',
            'amount' => 'Amount',
            'type' => 'Type',
            'work_id' => 'Work ID',
            'peer_user' => 'Peer User',
            'comment' => 'Comment',
            'create_time' => 'Create Time',
        ];
    }
}
