<?php

namespace EntitySchema\Maintenance;

use EntitySchema\Domain\Storage\IdGenerator;

/**
 * Returns a constant fixed id
 *
 * This is inteded to be used in maintenance scripts to create some predefined initial EntitySchemas
 *
 * @license GPL-2.0-or-later
 */
class FixedIdGenerator implements IdGenerator {

	/** @var int */
	private $fixId;

	public function __construct( int $fixId ) {
		$this->fixId = $fixId;
	}

	public function getNewId(): int {
		return $this->fixId;
	}

}
