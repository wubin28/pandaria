package com.github.jakimli.pandaria.steps;

import com.github.jakimli.pandaria.domain.FeatureConfiguration;
import com.github.jakimli.pandaria.domain.variable.Variables;
import cucumber.api.java.en.Given;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Locale;

public class FeatureConfigurationSteps {

    @Autowired
    FeatureConfiguration configuration;

    @Autowired
    Variables variables;

    @Given("^dir: ([^\"]*)")
    public void dir(String dir) {
        configuration.dir(dir);
    }

    @Given("^base uri: ([^\"]*)")
    public void baseUri(String uri) {
        configuration.baseUri(variables.interpret(uri));
    }

    @Given("^faker locale: ([^\"]*)")
    public void fakerLocale(String locale) {
        configuration.fakerLocale(new Locale(locale));
    }
}
