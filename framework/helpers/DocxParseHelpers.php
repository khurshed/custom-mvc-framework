<?php

class DocxParseHelpers{
    private $filename;

    public function __construct($filePath) {
        $this->filename = $filePath;
    }
    
    public function convertToText() {
        
        if(isset($this->filename) && !file_exists($this->filename)) {
            return "File Not exists";
        }

        $fileArray = pathinfo($this->filename);
        $file_ext  = strtolower($fileArray['extension']);
        if($file_ext == "doc" || $file_ext == "docx")
        {
            if($file_ext == "doc") {
                return $this->readDocWv();
            } elseif($file_ext == "docx") {
                return $this->read_docx();
            } 
        } else {
            return "Invalid File Type";
        }
    }
    
    
    private function read_docx(){

        $striped_content = '';
        $content = '';

        $zip = zip_open($this->filename);

        if (!$zip || is_numeric($zip)) return false;

        while ($zip_entry = zip_read($zip)) {

            if (zip_entry_open($zip, $zip_entry) == FALSE) continue;

            if (zip_entry_name($zip_entry) != "word/document.xml") continue;

            $content .= zip_entry_read($zip_entry, zip_entry_filesize($zip_entry));

            zip_entry_close($zip_entry);
        }// end while

        zip_close($zip);

        $content = str_replace('</w:r></w:p></w:tc><w:tc>', " ", $content);
        $content = str_replace('</w:r></w:p>', "\r\n", $content);
        $striped_content = strip_tags($content);
        return $striped_content;
    }

    
    
    private function readDocWv(){
        $output = str_replace('.doc', '.txt', $this->filename);
        shell_exec('/usr/bin/wvText ' . $this->filename . ' ' . $output);
        $text = file_get_contents($output);
        # Convert to UTF-8 if needed
        if(!mb_detect_encoding($text, 'UTF-8', true))
        {
            $text = utf8_encode($text);
        }
        unlink($output);
        return $text;
    }

}