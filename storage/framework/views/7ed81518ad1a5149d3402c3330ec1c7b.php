<div
    <?php echo e($attributes
            ->merge([
                'id' => $getId(),
            ], escape: false)
            ->merge($getExtraAttributes(), escape: false)); ?>

>
    <?php echo e($getChildComponentContainer()); ?>

</div>
<?php /**PATH /home/betspacebr-demo1/htdocs/demo1.betspacebr.com/vendor/filament/forms/src/../resources/views/components/grid.blade.php ENDPATH**/ ?>