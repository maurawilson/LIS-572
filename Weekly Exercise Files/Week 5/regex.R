#different ways I wrote the regular expressions for SPL-regex and their results

"^[0-9]{4}[^.]" #returns nothing

"^[0-9]{4}" #does not include with [], but does include with . NA = 3657668

"^[0-9^.]{4}". #does not include with [], but does include with . cannot tell difference from above. NA = 3657668

"^[0-9]{4}$" #does not include the [], ., or any other combo except four digits. NA = 5535198

""

