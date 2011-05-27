<?php

function autoload($class)
{
    include ( __DIR__ . '/../' . $class . '.php' );
}

spl_autoload_register('autoload');