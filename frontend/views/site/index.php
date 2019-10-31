<?php
/* @var $this yii\web\View */
$this->title = Yii::$app->name;
?>
<div class="site-index">


    <div class="body-content">

        <div class="row">
            <div class="col-lg-2">
                <ul class="list-group">
                    <li class="list-group-item">
                        <a href="<?=\yii\helpers\Url::toRoute('task/ins-follow', true);?>"><?=Yii::t("frontend", 'Ins Follow')?></a>
                    </li>
                    <li class="list-group-item">
                        <a href="<?=\yii\helpers\Url::toRoute('task/ins-like', true);?>"><?=Yii::t("frontend", 'Ins Like')?></a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-8">
                <h2><?=Yii::t('frontend', 'Article')?></h2>

                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.</p>

                <p><a class="btn btn-default" href="http://www.yiiframework.com/forum/">Yii Forum &raquo;</a></p>
            </div>
            <div class="col-lg-2">
                <h2>Heading</h2>

                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.</p>

                <p><a class="btn btn-default" href="http://www.yiiframework.com/extensions/">Yii Extensions &raquo;</a></p>
            </div>
        </div>

    </div>
</div>
