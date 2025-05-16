#!/usr/bin/env nextflow

params.greeting = 'Hello world!'

include { TEXTTOUPPER; TEXTSPLIT } from './hi-modules/text'
include { SPLITLETTERS } from './hi-modules/text/split'
include { CONVERTTOUPPER } from './hi-modules/text/convert'


workflow my_workflow_one{
    letters_ch1 = TEXTSPLIT(params.greeting)
    results_ch1 = TEXTTOUPPER(letters_ch1.flatten())
    results_ch1.view { it }
}

workflow my_workflow_two {
    letters_ch2 = SPLITLETTERS(params.greeting)
    results_ch2 = CONVERTTOUPPER(letters_ch2.flatten())
    results_ch2.view { it }
}

workflow {
    my_workflow_one()
    my_workflow_two()
}