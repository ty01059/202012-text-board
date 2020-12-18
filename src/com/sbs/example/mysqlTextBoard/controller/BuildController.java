package com.sbs.example.mysqlTextBoard.controller;

import com.sbs.example.mysqlTextBoard.Container;
import com.sbs.example.mysqlTextBoard.service.BuildService;

public class BuildController extends Controller {
	private BuildService buildService;

	public BuildController() {
		buildService = Container.buildService;
	}

	public void doCommand(String cmd) {
		if (cmd.startsWith("build site")) {
			doBuildSite(cmd);
		}
	}

	private void doBuildSite(String cmd) {
		System.out.println("== 사이트 생성 ==");
		
		buildService.buildSite();
	}
}
