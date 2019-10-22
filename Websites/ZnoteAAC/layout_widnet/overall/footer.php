																			</div>                                                                   
																		</div>
																	</div>
																</div>
																<!-- content end -->
															</div>
															<!-- mainmiddle end -->
														</div>
													</div>
													<!-- main end -->
												</div>
											</div>
										</div>
									</div>
									<div class="middle-container-b">
										<div class="middle-bl"></div>
										<div class="middle-br"></div>
										<div class="middle-b"></div>
									</div>
								</div>
								<!-- middle end -->
								<div id="footer">
									<center>
										<?php 
											echo 'Server date and clock is: '. getClock(false, true) .' Page generated in '. elapsedTime() .' seconds. Q: '.$aacQueries;
										?><br>Created by Widnet for Gesior AAC, converted to <a href="credits.php">Znote AAC</a> by Znote.
									</center>
								</div>
								<!-- footer end -->
								<div id="debug"><?php 
									//data_dump($accQueriesData, false, "Done Queries"); 
								?></div>
								<!-- debug end -->
							</div>
						</div>
					</div>		
				</div>
			</div>		
		</div>
		<!-- page-body end -->
	</body>
</html>