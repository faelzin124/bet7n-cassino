<?php
    use Filament\Support\Facades\FilamentView;
?>

<!--[if BLOCK]><![endif]--><?php if($this->hasUnsavedDataChangesAlert() && (! FilamentView::hasSpaMode())): ?>
        <?php
        $__scriptKey = '3563432852-0';
        ob_start();
    ?>
        <script>
            window.addEventListener('beforeunload', (event) => {
                if (
                    window.jsMd5(
                        JSON.stringify($wire.data).replace(/\\/g, ''),
                    ) === $wire.savedDataHash ||
                    $wire?.__instance?.effects?.redirect
                ) {
                    return
                }

                event.preventDefault()
                event.returnValue = true
            })
        </script>
        <?php
        $__output = ob_get_clean();

        \Livewire\store($this)->push('scripts', $__output, $__scriptKey)
    ?>
<?php endif; ?><!--[if ENDBLOCK]><![endif]-->
<?php /**PATH /home/betspacebr-demo1/htdocs/demo1.betspacebr.com/vendor/filament/filament/src/../resources/views/components/page/unsaved-data-changes-alert.blade.php ENDPATH**/ ?>