Describe 'Calculator tests' {
    it 'should add two numbers' {
        $a = 4
        $b = 5
        $result = $a + $b
        $result | Should -Be 9
    }
}

Describe 'Pizza data tests' {
    it 'should contain pizza rows' {
        $csvdata = Import-Csv -Path "/workspaces/PesterWorkshop/.devcontainer/pesterWorkshopData.csv" -Delimiter ";"
        $csvdata.Count | Should -BeGreaterThan 1
    }
    it 'should check pizza names' {
        $csvdata = Import-Csv -Path "/workspaces/PesterWorkshop/.devcontainer/pesterWorkshopData.csv" -Delimiter ";"
        $csvdata.item(0).Type | Should -Be Margarita
        $csvdata.item(1).Type | Should -Not -Be Margarita
        $csvdata.item(1).Type | Should -Be Salami
        $csvdata.item(2).Type | Should -Not -Be Salami
        $csvdata.item(2).Type | Should -Be Funghi
    }
    it 'should check pizza prices' {
        $csvdata = Import-Csv -Path "/workspaces/PesterWorkshop/.devcontainer/pesterWorkshopData.csv" -Delimiter ";"
        $csvdata.item(0).Price | Should -Be 5.99
        $csvdata.item(1).Price | Should -Not -Be 5.99
        $csvdata.item(1).Price | Should -Be 6.55
        $csvdata.item(2).Price | Should -Not -Be 6.55
        $csvdata.item(2).Price | Should -Be 8.75
    }
    it 'should check calzone pizza' {
        $csvdata = Import-Csv -Path "/workspaces/PesterWorkshop/.devcontainer/pesterWorkshopData.csv" -Delimiter ";"
        $csvdata.item(9).Number | Should -Be 10
        $csvdata.item(9).Number | Should -Be 11 -Not
        $csvdata.item(9).Type | Should -Be Calzone
        $csvdata.item(9).Type | Should -Be Funghe -Not
        $csvdata.item(9).Price | Should -Be 11.11
    }
    it 'should check quattro stagioni pizza' {
        $csvdata = Import-Csv -Path "/workspaces/PesterWorkshop/.devcontainer/pesterWorkshopData.csv" -Delimiter ";"
        $csvdata.item(5).Number | Should -Be 6
        $csvdata.item(5).Number | Should -Be 11 -Not
        $csvdata.item(5).Type | Should -Be "Quattro Stagioni"
        $csvdata.item(5).Type | Should -Be "Quattro St" -Not
        $csvdata.item(5).Type | Should -Be Funghe -Not
        $csvdata.item(5).Price | Should -Be 9.50
    }
} 