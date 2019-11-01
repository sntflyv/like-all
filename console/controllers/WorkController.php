<?php

namespace console\controllers;


use common\models\Task;
use common\models\Work;
use GuzzleHttp\Client;
use yii\console\Controller;

class WorkController extends Controller
{

    protected $rules = [
        'ins-like' => '"userInteractionCount":"(\d+)"',
        'ins-follow' => '"userInteractionCount":"(\d+)"',
    ];

    /** @var Client */
    protected $client;

    public function actionIndex()
    {
        $this->client = new Client([
            'headers' => [
                'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36',
                'referer' => 'https://www.instagram.com/p/B1aYTBSB7iQ/',
            ],
            'verify' => false,
        ]);
        /** @var Work $work */
        $res = $this->query('https://www.instagram.com/jelly_jilli/', 'ins-follow');
        var_dump($res);

        $res = $this->query('https://www.instagram.com/p/B3hAd57BiBk/', 'ins-like');
        var_dump($res);
    }

    /**
     * 执行任务
     *
     * @param Work $work
     * @return bool|int|mixed
     */
    protected function execute(Work $work)
    {
        /** @var Task $task */
        $task = Task::find()->where(['task_id' => $work->task_id])->one();
        if (!$task) {
            return false;
        }
        return $this->query($task->link, $task->service_type);
    }

    protected function query(string $url, string $type)
    {
        $resp = $this->client->get($url);
        $result = $resp->getBody()->getContents();
        $pattern = $this->getRules($type);
        if ($pattern) {
            if (preg_match($pattern, $result, $matches)) {
                return $matches[1];
            }
        }
        return 0;
    }

    protected function getRules(string $type)
    {
        if (isset($this->rules[$type])) {
            return sprintf('#%s#', $this->rules[$type]);
        }
        return false;
    }
}
